# Solution for Task: Benchmark loading times

[File paths to be created and modified]:
- `geometryos/data/`
- `geometryos/geojson/`

A brief snippet of the Python or Rust code required:
```python
from geometry import Geometry
import os

# Create a new geometry object for each file path specified in file_paths
for file_path in file_paths:
    # Load the GeoJSON data from the file at `file_path` and convert it into a Geometry object
    geom = Geometry(os.path.basename(file_path))
    
    # Apply the specified transformation to the Geometry object
    geom = geom.transform(geom.get_bounding_box().to_crs("epsg:4326"))
    
    # Write the transformed geometry back to the file at `file_path`
    with open(file_path, "w") as f:
        f.write(geom)
```

[Next Step command for user]: 
- Run the Python or Rust code provided in step 3 and inspect the resulting GeoJSON files in the `geometryos/geojson` directory.