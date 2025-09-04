CREATE DATABASE Monet_collection;

USE Monet_collection;

-- Table 1: Artists 
CREATE TABLE Artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_year INT,
    death_year INT,
    nationality VARCHAR(50)
);

INSERT INTO Artists (name, birth_year, death_year, nationality) VALUES 
('Claude Monet', 1840, 1926, 'French');

-- Table 2: Collections 
CREATE TABLE Collections (
    collection_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO Collections (name) VALUES 
('Art Institute of Chicago Collection');

-- Table 3: Locations 
CREATE TABLE Locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255)
);

INSERT INTO Locations (name, address) VALUES 
('Gallery 201', 'Art Institute of Chicago, 111 S Michigan Ave, Chicago, IL 60603');


-- Table 4: Mediums 
CREATE TABLE Mediums (
    medium_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO Mediums (name) VALUES 
('Oil on Canvas');

-- Table 5: Styles 
CREATE TABLE Styles (
    style_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO Styles (name) VALUES 
('Impressionism');

-- Table 6: Subjects 
CREATE TABLE Subjects (
    subject_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO Subjects (name) VALUES 
('Water Lilies'),
('Landscape'),
('Nature');

-- Table 7: Time_Periods 
CREATE TABLE Time_Periods (
    time_period_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    start_year INT,
    end_year INT
);

INSERT INTO Time_Periods (name, start_year, end_year) VALUES 
('19th Century', 1801, 1900),
('20th Century', 1901, 2000);

-- Table 8: Publications 
CREATE TABLE Publications (
    publication_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(100)
);

INSERT INTO Publications (title, author) VALUES 
('Claude Monet: Water Lilies', 'Paul Hayes Tucker'),
('Monet: The Triumph of Impressionism', 'Daniel Wildenstein');

-- Table 9: Frames 
CREATE TABLE Frames (
    frame_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO Frames (name) VALUES 
('Wooden Frame'),
('Metal Frame'),
('Gilded Frame');

-- Table 10: Conditions
CREATE TABLE Conditions (
    condition_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

INSERT INTO Conditions (name) VALUES 
('Excellent'),
('Good'),
('Fair'),
('Not Good');

-- Table 11: Acquisition_Methods 
CREATE TABLE Acquisition_Methods (
    method_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

INSERT INTO Acquisition_Methods (name) VALUES 
('Purchase'),
('Gift'),
('Bequest');

-- Table 12: Artworks 
CREATE TABLE Artworks (
    artwork_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    artist_id INT NOT NULL,
    creation_year INT,
    collection_id INT,
    location_id INT,
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
    FOREIGN KEY (collection_id) REFERENCES Collections(collection_id),
    FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);

INSERT INTO Artworks (title, artist_id, creation_year, collection_id, location_id) VALUES
('Stacks of Wheat (End of Summer)', 1, 1890, 1, 1),
('Water Lilies', 1, 1906, 1, 1),
('Arrival of the Normandy Train, Gare Saint-Lazare', 1, 1877, 1, 1),
('The Beach at Sainte-Adresse', 1, 1867, 1, 1),
('Cliff Walk at Pourville', 1, 1882, 1, 1),
('Stacks of Wheat (End of Day, Autumn)', 1, 1890, 1, 1),
('Bordighera', 1, 1884, 1, 1),
('Water Lily Pond', 1, 1900, 1, 1),
('Branch of the Seine near Giverny (Mist)', 1, 1897, 1, 1),
('The Artist’s House at Argenteuil', 1, 1873, 1, 1),
('Apples and Grapes', 1, 1880, 1, 1),
('On the Bank of the Seine, Bennecourt', 1, 1868, 1, 1),
('Rocks at Port-Goulphar, Belle-Île', 1, 1886, 1, 1),
('Charing Cross Bridge, London', 1, 1901, 1, 1),
('Poppy Field (Giverny)', 1, 1890, 1, 1),
('Houses of Parliament, London', 1, 1900, 1, 1),
('Waterloo Bridge, Sunlight Effect', 1, 1903, 1, 1),
('Irises', 1, 1914, 1, 1),
('Water Lily Pond', 1, 1917, 1, 1),
('Stacks of Wheat (Sunset, Snow Effect)', 1, 1890, 1, 1),
('The Petite Creuse River', 1, 1889, 1, 1),
('Boats on the Beach at Étretat', 1, 1885, 1, 1),
('Stack of Wheat', 1, 1890, 1, 1),
('Vétheuil', 1, 1901, 1, 1),
('Stack of Wheat (Thaw, Sunset)', 1, 1890, 1, 1),
('Venice, Palazzo Dario', 1, 1908, 1, 1),
('Stack of Wheat (Snow Effect, Overcast Day)', 1, 1890, 1, 1),
('The Departure of the Boats, Étretat', 1, 1885, 1, 1);

-- Table 13: Artwork_Mediums 
CREATE TABLE Artwork_Mediums (
    artwork_id INT NOT NULL,
    medium_id INT NOT NULL,
    PRIMARY KEY (artwork_id, medium_id),
    FOREIGN KEY (artwork_id) REFERENCES Artworks(artwork_id),
    FOREIGN KEY (medium_id) REFERENCES Mediums(medium_id)
);

SELECT artwork_id, title FROM Artworks;

INSERT INTO Artwork_Mediums (artwork_id, medium_id) VALUES 
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (8, 1), 
(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1),
(17, 1), (18, 1), (19, 1), (20, 1), (21, 1), (22, 1), (23, 1), 
(24, 1), (25, 1), (26, 1), (27, 1), (28, 1);

-- Table 14: Artwork_Styles 
CREATE TABLE Artwork_Styles (
    artwork_id INT NOT NULL,
    style_id INT NOT NULL,
    PRIMARY KEY (artwork_id, style_id),
    FOREIGN KEY (artwork_id) REFERENCES Artworks(artwork_id),
    FOREIGN KEY (style_id) REFERENCES Styles(style_id)
);

INSERT INTO Artwork_Styles (artwork_id, style_id) VALUES 
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (8, 1), 
(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1),
(17, 1), (18, 1), (19, 1), (20, 1), (21, 1), (22, 1), (23, 1), 
(24, 1), (25, 1), (26, 1), (27, 1), (28, 1);


-- Table 15: Collection_Locations 
CREATE TABLE Collection_Locations (
    collection_id INT NOT NULL,
    location_id INT NOT NULL,
    PRIMARY KEY (collection_id, location_id),
    FOREIGN KEY (collection_id) REFERENCES Collections(collection_id),
    FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);

INSERT INTO Collection_Locations (collection_id, location_id) VALUES 
(1, 1);


-- Table 16: Artwork_Publications 
CREATE TABLE Artwork_Publications (
    artwork_id INT NOT NULL,
    publication_id INT NOT NULL,
    PRIMARY KEY (artwork_id, publication_id),
    FOREIGN KEY (artwork_id) REFERENCES Artworks(artwork_id),
    FOREIGN KEY (publication_id) REFERENCES Publications(publication_id)
);
INSERT INTO Artwork_Publications (artwork_id, publication_id) VALUES 
(1, 1), (2, 2), (3, 1), (4, 2), (5, 1), (6, 2), (7, 1), (8, 2), 
(9, 1), (10, 2), (11, 1), (12, 2), (13, 1), (14, 2), (15, 1), (16, 2),
(17, 1), (18, 2), (19, 1), (20, 2), (21, 1), (22, 2), (23, 1), 
(24, 2), (25, 1), (26, 2), (27, 1), (28, 2);

-- Table 17: Techniques
CREATE TABLE Techniques (
    technique_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO Techniques (name) VALUES 
('Impasto'),
('Glazing'),
('Wet-on-Wet'),
('Layering');

-- Table 18: Exhibitions
CREATE TABLE Exhibitions (
    exhibition_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE
);

INSERT INTO Exhibitions (name, start_date, end_date) VALUES 
('Monet and Chicago', '2020-09-05', '2021-01-18'),
('Claude Monet: 1840-1926', '1995-07-22', '1995-11-26');

-- Table 19: Rooms 
CREATE TABLE Rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    gallery_id INT,
    FOREIGN KEY (gallery_id) REFERENCES Locations(location_id)
);

INSERT INTO Rooms (name, gallery_id) VALUES 
('Monet Room', 1),
('Impressionist Gallery', 1),
('Special Exhibition Hall', 1);

-- Table 20: Main_Colors
CREATE TABLE Main_Colors (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

INSERT INTO Main_Colors (name) VALUES 
('Blue'),
('Green'),
('Pink'),
('Yellow'),
('Violet'),
('Orange');

-- Table 21:Artwork_Colors
CREATE TABLE Artwork_Colors (
    artwork_id INT NOT NULL,
    color_id INT NOT NULL,
    PRIMARY KEY (artwork_id, color_id),
    FOREIGN KEY (artwork_id) REFERENCES Artworks(artwork_id),
    FOREIGN KEY (color_id) REFERENCES Main_Colors(color_id)
);
INSERT INTO Artwork_Colors (artwork_id, color_id) VALUES 
(1, 1), (1, 2), 
(2, 2), (2, 3), 
(3, 1), (3, 4), 
(4, 3), (4, 2), 
(5, 2), (5, 5), 
(6, 1), (6, 2), 
(7, 4), (7, 2), 
(8, 3), (8, 2), 
(9, 2), (9, 3), 
(10, 5), (10, 2), 
(11, 6), (11, 2), 
(12, 2), (12, 3), 
(13, 3), (13, 4), 
(14, 2), (14, 4), 
(15, 1), (15, 3), 
(16, 2), (16, 4), 
(17, 2), (17, 3), 
(18, 1), (18, 4), 
(19, 2), (19, 3), 
(20, 4), (20, 2), 
(21, 5), (21, 1), 
(22, 2), (22, 3), 
(23, 6), (23, 1), 
(24, 1), (24, 4), 
(25, 2), (25, 4), 
(26, 2), (26, 3), 
(27, 1), (27, 2), 
(28, 2), (28, 4);

-- Query 1: Finding the most used color across all artworks
SELECT c.name AS Main_Color, COUNT(ac.artwork_id) AS Usage_Count
FROM Main_Colors c
JOIN Artwork_Colors ac ON c.color_id = ac.color_id
JOIN Artworks a ON ac.artwork_id = a.artwork_id
GROUP BY c.name
ORDER BY Usage_Count DESC;

-- Query 2:  Counting the number of artworks by medium
SELECT m.name AS Medium, COUNT(a.artwork_id) AS Artwork_Count
FROM Mediums m
JOIN Artwork_Mediums am ON m.medium_id = am.medium_id
JOIN Artworks a ON am.artwork_id = a.artwork_id
GROUP BY m.name;

-- Query 3: listsing all publications and the titles of the artworks they discuss
SELECT p.title AS Publication, a.title AS Artwork
FROM Publications p
JOIN Artwork_Publications ap ON p.publication_id = ap.publication_id
JOIN Artworks a ON ap.artwork_id = a.artwork_id;

-- Query 4: Listing the artworks with their locations and collections
SELECT a.title AS Artwork, l.name AS Location, c.name AS Collection
FROM Artworks a
JOIN Locations l ON a.location_id = l.location_id
JOIN Collections c ON a.collection_id = c.collection_id;

-- Query 5: Listing the artworks with their mediums and number of publications
SELECT a.title AS Artwork_Title, m.name AS Medium, COUNT(ap.publication_id) AS Number_of_Publications
FROM Artworks a
JOIN Artwork_Mediums am ON a.artwork_id = am.artwork_id
JOIN Mediums m ON am.medium_id = m.medium_id
LEFT JOIN Artwork_Publications ap ON a.artwork_id = ap.artwork_id
GROUP BY a.artwork_id, a.title, m.name
ORDER BY Number_of_Publications DESC;

