# Solution for Task: Add tile coordinate tracking

[File Paths](#file-paths):
1. `tiles/tracking_tile.h`: This file contains the tile coordinate tracking logic and includes a Python class for storing and manipulating tile positions.
2. `lib/tracking_api.rs`: This file implements a Rust interface to the Geometry OS API to track tiles and generate tile metadata.
3. `cli/main.rs`: This is the command-line interface (CLI) program that uses the tracking API to interact with Geometry OS.

[Snippet of Python Code Required](#python-code):
```python
class TileCoordinates:
    def __init__(self, x, y):
        self.x = x
        self.y = y
        
    def __str__(self):
        return f"{self.x}, {self.y}"
    
def tile_to_dict(tile):
    return {'x': tile.x, 'y': tile.y}

def dict_to_tile(data):
    x = data['x']
    y = data['y']
    tile = TileCoordinates(int(x), int(y))
    return tile
    
def add_to_list(lst, item):
    if not lst:
        return [item]
    else:
        return lst + [item]
        
class GeometryOSApiClient:
    def __init__(self, base_url):
        self.base_url = base_url
    
    def track(self, tile):
        payload = {'tiles': [tile_to_dict(tile)]}
        response = requests.post(f'{self.base_url}/track', data=payload)
        return response.json()
        
class TrackingTile:
    def __init__(self, x, y):
        self.x = x
        self.y = y
        
    def __str__(self):
        return f"{self.x}, {self.y}"
    
def create_tile(position):
    tile = TrackingTile(*position)
    return tile
    
def add_to_list_of_tiles(tile_list, tile):
    if not tile_list:
        tile_list.append(tile)
    else:
        for tile in tile_list:
            if tile == tile:
                return False
        
        tile_list += [tile]
        
def track_tiles(tiles):
    tracking_tiles = []
    
    for tile in tiles:
        try:
            position = tile.position()
            
            # check if position is already in the list of known positions (i.e., not a newly added tile)
            if not add_to_list_of_tiles(tracking_tiles, tile):
                tracking_tile = create_tile(position)
                tracking_tiles.append(tracking_tile)
        except Exception as error:
            print(f"Error while tracking tile {tile}: {error}")
    
    return tracking_tiles
        
class GeometryOSClient:
    def __init__(self, api_token):
        self.api_token = api_token
    
    def add_tracking_tiles(self, tiles):
        response = requests.post(f'{self.base_url}/add', json=tile_to_dict(tiles))
        
        if response.status_code != 201:
            raise Exception("Adding tracking tiles failed with status code: " + str(response.status_code))
        
    def get_tracked_tiles(self):
        response = requests.get(f'{self.base_url}/tile')
    
        if response.status_code != 200:
            raise Exception("Getting tracked tiles failed with status code: " + str(response.status_code))
        
        return response.json()
    
    def get_tracking_tiles(self):
        tracking_tile_list = []
        
        for tile in self.get_tracked_tiles():
            try:
                position = tile['position']
                
                # check if position is already in the list of known positions (i.e., not a newly added tile)
                if not add_to_list_of_tiles(tracking_tile_list, tile):
                    tracking_tile = create_tile(position)
                    tracking_tiles.append(tracking_tile)
            except Exception as error:
                print(f"Error while adding tracking tile {tile}: {error}")
        
        return tracking_tiles
```

[Snippet of Rust Code Required](#rust-code):
```rust
use std::collections::HashMap;
use geometryos::api::{GeometryOSApiClient, GeometryOSClient};

#[derive(Debug)]
struct TileCoordinates {
    x: i32,
    y: i32,
}

impl TileCoordinates {
    fn new(x: i32, y: i32) -> Self {
        Self { x, y }
    }
    
    fn __str__(&self) -> &'static str {
        &*format!("({}, {})", self.x, self.y)
    }
}

fn tile_to_dict(tile: &TileCoordinates) -> HashMap<String, TileCoordinates> {
    let mut dictionary = HashMap::new();
    
    if tile.x < 0 || tile.x > 100 || tile.y < 0 || tile.y > 100 {
        return dictionary;
    }
    
    dictionary.insert("x".to_string(), TileCoordinates::new(tile.x - 50, tile.y - 50));
    dictionary.insert("y".to_string(), TileCoordinates::new(tile.x + 50, tile.y - 50));
    
    return dictionary;
}

fn dict_to_tile(data: &HashMap<String, TileCoordinates>) -> Option<TileCoordinates> {
    if let Some(value) = data.get("x") {
        return Some(TileCoordinates::new(*value, *data["y"]))
    }
    
    return None;
}

fn tile_to_list(tile: &TileCoordinates) -> Vec<TileCoordinates> {
    vec![TileCoordinates::new(tile.x - 50, tile.y - 50), TileCoordinates::new(tile.x + 50, tile.y - 50)]
}
    
fn add_to_list_of_tiles(tile_list: &mut Vec<TileCoordinates>, tile: &TileCoordinates) {
    if let Some(position) = tile_list.iter().find(|element| element == *tile) {
        tile_list[0] = tile_to_dict(&tile)
                     .or_else(|| tile_to_list(&*tile))?;
    } else {
        let position = tile.pos();
        
        if let Some(position) = tile_list.iter().find(|element| element == *position) {
            tile_list[0] = tile_to_dict(&tile)?;
        } else {
            tile_list.push(*tile);
        }
    }
}
    
fn get_tracked_tiles() -> HashMap<TileCoordinates, TileCoordinates> {
    let mut dictionary = HashMap::new();
    
    for tile in GeometryOSApiClient::get_tracked_tiles().unwrap() {
        let position = tile.position();
        
        if let Some(tile) = dictionary.entry(TileCoordinates::from_str(&tile.pos)?) {
            if tile.pos != position {
                dictionary.insert(tile);
            }
        } else {
            let dict: HashMap<_, _> = tile_to_dict(&tile).unwrap();
            
            dictionary.insert(dict);
        }
    }
    
    return dictionary;
}

fn get_tracking_tiles() -> Vec<TileCoordinates> {
    let mut tiles: Vec<TileCoordinates> = vec![];
    
    for tile in GeometryOSClient::get_tile_coordinates().unwrap() {
        match dictionary_to_tile(&tile)? {
            Some(tile) => tiles.push(*tile),
            None => continue,
        }
    }
    
    return tiles;
}
    
fn tile_to_dict(tile: &TileCoordinates) -> Option<HashMap<String, TileCoordinates>> {
    let dict = GeometryOSApiClient::get_tracked_tiles().unwrap();
    
    if let Some(tile) = dictionary.get(&*tile) {
        return Some(tile.to_dict());
    } else {
        let dict: HashMap<_, _> = tile_to_dict(&*tile).unwrap();
        
        return Some(dict);
    }
}
    
fn dictionary_to_tile(tile: &HashMap<String, TileCoordinates>) -> Option<TileCoordinates> {
    match tile {
        &mut dict => if let Some(value) = dict.get("x") {
                        return Some(*value);
                      },
        _ => None,
    }
    
    return None;
}
    
fn main() {
    let mut tiles: Vec<TileCoordinates> = get_tracking_tiles();
    
    for tile in tiles.iter().filter(|t| !t.is_empty()) {
        if let Some(mut dictionary) = tile_to_dict(&*tile)? {
            for (key, value) in &dictionary {
                println!("{}: {}", key, *value);
            }
            
            println!();
        } else {
            println!("Error: No tracked tiles found!");
        }
    }
}
```