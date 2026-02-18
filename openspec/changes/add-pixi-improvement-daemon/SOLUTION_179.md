# Solution for Task: Test end-to-end tile loading

[FILE PATHS REQUIRED: `geometries_data/pixi_tiles.json`, `configs/tile_cache.conf`]

Brief Snippet of Python or Rust Code Required:
```python
import json
from pathlib import Path

def generate_tile_metadata(geometry, cache_path):
    # Converts a GeoJSON geometry to an array of coordinates.
    with open(geometry, 'r') as f:
        data = json.load(f)
        
    # Extracts the tile metadata from the JSON file.
    metadata = {
        'geometry': data['geometry']['coordinates'],
        'bbox': data['bbox'],
        'projection': data['crs']['init'],
        'crs_type': data['crs']['type']
    }
    
    # Writes the tile metadata to a JSON file.
    with open(cache_path, 'w') as f:
        json.dump(metadata, f)
        
def load_tile_metadata(cache_path):
    # Loads the cached tile metadata from JSON file.
    with open(cache_path, 'r') as f:
        data = json.load(f)
        
    return data

def main():
    # Gets a GeoJSON file path and a cache path.
    geometry_file_path = input("Enter the path to the GeoJSON file: ")
    cache_path = input("Enter the path to the tile cache directory: ")
    
    # Generates tile metadata from the GeoJSON file.
    tiles = []
    for geometry in json.load(open(geometry_file_path)):
        metadata = load_tile_metadata(cache_path + '/' + geometry['id'])
        
        geometry = [float(x) for x in geometry['geometry']]
        bbox = [float(x) for x in geometry['bbox']]
        projection = geometry['crs']['init']
        crs_type = geometry['crs']['type']
        
        tile = {
            'id': geometry['id'],
            'geometry': geometry,
            'projection': projection,
            'crs_type': crs_type
        }
        
        tiles.append(tile)
    
    # Writes tile metadata to JSON file.
    with open(cache_path + '/tiles.json', 'w') as f:
        json.dump(tiles, f)

if __name__ == '__main__':
    main()
```

Next Step Command for User (e.g. Create a file, run a script):
```bash
python generate_tile_metadata.py geometries_data/pixi_tiles.json configs/tile_cache.conf
```