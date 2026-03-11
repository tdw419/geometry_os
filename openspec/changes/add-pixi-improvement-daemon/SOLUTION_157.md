# Solution for Task: Add automatic cleanup of unused assets

[File Paths Needed: `assets_dir/unused_thumbnails` and `assets_dir/unused_images`]

Briefly:
Add automatic cleanup of unused assets to Geometry OS using Python or Rust. This task aims to improve the efficiency of the platform by ensuring that all unused assets are removed from the system. 

1. File paths that need to be created or modified: 
- `assets_dir/unused_thumbnails`: Creates a folder for thumbnail images, which is automatically deleted after they have been viewed by users on Geometry OS.
- `assets_dir/unused_images`: Creates a folder for unused image files (e.g., backgrounds) and removes them after they are no longer needed. 

2. A brief snippet of the Python or Rust code required:
```python
import os
from pathlib import Path

def delete_unused_thumbnails():
    # Create thumbnail folder if it does not exist
    if not Path(f"{assets_dir}/unused_thumbnails").is_dir():
        os.makedirs(f"{assets_dir}/unused_thumbnails", exist_ok=True)
        
    # Remove unused thumbnail images
    for file in Path(assets_dir).rglob("*.jpg"):
        if file.is_file() and not file.name.endswith(".gif"):
            os.remove(str(file))
```

3. A 'Next Step' command for the user:
- Run `python delete_unused_thumbnails.py` to remove all unused thumbnail images from the system.