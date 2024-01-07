-- Create Users table
CREATE TABLE Users (
    user_id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    username TEXT UNIQUE,
    password TEXT -- Assuming hashing algorithm with 128 characters
);

-- Create Schools table
CREATE TABLE Schools (
    school_id INTEGER PRIMARY KEY,
    name TEXT,
    type TEXT CHECK(type IN ('Primary', 'Secondary', 'Higher Education')),
    location TEXT,
    founded_year INTEGER
);

-- Create Companies table
CREATE TABLE Companies (
    company_id INTEGER PRIMARY KEY,
    name TEXT,
    industry TEXT CHECK(industry IN ('Technology', 'Education', 'Business')),
    location TEXT
);

-- Create Connections table for connections with people, schools, and companies
CREATE TABLE Connections (
    connection_id INTEGER PRIMARY KEY,
    user_id INTEGER,
    school_id INTEGER,
    company_id INTEGER,
    title TEXT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (school_id) REFERENCES Schools(school_id),
    FOREIGN KEY (company_id) REFERENCES Companies(company_id)
);

-- Insert sample data
INSERT INTO Users (first_name, last_name, username, password) VALUES
    ('Claudine', 'Gay', 'claudine', 'password'),
    ('Reid', 'Hoffman', 'reid', 'password');

INSERT INTO Schools (name, type, location, founded_year) VALUES
    ('Harvard University', 'Higher Education', 'Cambridge, Massachusetts', 1636);

INSERT INTO Companies (name, industry, location) VALUES
    ('LinkedIn', 'Technology', 'Sunnyvale, California');

INSERT INTO Connections (user_id, school_id, title, start_date, end_date) VALUES
    (1, 1, 'PhD Pursuit', '1993-01-01', '1998-12-31'),
    (2, NULL, 'CEO and Chairman', '2003-01-01', '2007-02-01');
