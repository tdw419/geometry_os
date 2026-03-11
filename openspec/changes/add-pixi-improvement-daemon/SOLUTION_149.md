# Solution for Task: Implement object pooling

[File Paths Required: `obj_pool.py` and `object_pool.rs`]

[Brief Snippet of Python or Rust Code Required]

[Next Step Command for User]

```python
# Create file path to object pool
obj_path = "obj_pool"

# Create directory for objects if it does not exist
try:
    os.makedirs(obj_path)
except OSError as error:
    if error.errno != errno.EEXIST:
        raise

# Get list of files in the object pool folder
obj_list = sorted(glob.glob(f"{obj_path}/*"))

if len(obj_list) == 0:
    print("No files found in object pool.")
else:
    print(f"Found {len(obj_list)} objects in the object pool folder.")
```

[Next Step Command for User]

```rust
// Create directory for objects if it does not exist
let mut obj_path = "obj_pool";
if !std::fs::exists(&mut obj_path) {
    std::fs::create_dir(obj_path).unwrap();
}

// Get list of files in the object pool folder
let obj_list = std::fs::read_dir(&mut obj_path).unwrap();

if !obj_list.is_empty() {
    let mut file_paths: Vec<String> = Vec::new();
    for entry in obj_list {
        if let Ok(entry) = entry {
            let filename = entry.file_name().to_str().unwrap().to_string();
            if !filename.ends_with(".py") && !filename.ends_with(".rs") {
                continue;
            }

            file_paths.push(format!("{}/{}", obj_path, filename));
        }
    }

    println!(
        "Found {} Python and {} Rust files in the object pool folder: ({})".to_string(),
        file_paths.len(),
        file_paths.len(),
        std::str::from_utf8(&file_paths[..]).unwrap()
    );
} else {
    println!("No objects found in the object pool folder.");
}
```

[Next Step Command for User]

- Create a file path to object pool (`obj_pool.py`)
- Create a directory for objects if it does not exist (`obj_pool` in this case)
- Get the list of files in the object pool folder (`file_paths` variable)
- Check if each file extension (`.py`, `.rs`) is found
  - If not, skip that file
  - Otherwise, add it to the `file_paths` vector
- Print a summary of the file path and file list (comma separated)
