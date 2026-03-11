# Solution for Task: Optimize texture loading

[Context: Geometry OS Implementation Agent]
Your task is to provide a concise and detailed implementation plan or code solution for the following OpenSpec task: Optimize texture loading. The context of this task is to improve the texture loading system in Geometry OS, and the objective is to optimize the texture loading process by minimizing load times and improving performance.

1. File Paths Required and Modified
- The original file paths for loading textures are:
  - `texture_list.txt` (contains a list of all available textures)
  - `texture_data.json` (containing information on the texture data)

To optimize texture loading, we will modify these file paths to include new file paths that contain optimized versions of the textures:
- `texture_list.txt`:
  - Add a new line with the name of an optimized texture file (e.g., `optimized_texture_name.png`)
  - Remove all other lines from the file
- `texture_data.json`:
  - Add a new field for each optimized texture file, containing its optimized filename and hash:
    ```json
    {
      "texture1": {
        "filename": "optimized_texture_name.png",
        "hash": "23456789abcdefghijklmnopqrstuvwxyz"
      },
      ...
    }
    ```

2. A Brief Snippet of Python or Rust Code Required
- Python code:
  - Write a script that iterates over all textures in the `texture_list.txt` file and converts them to their optimized versions using the `convert_to_optimized_texture` function from the `gos_lib` library:
    ```python
    import os
    import gos_lib as gos
    
    # Load texture list from text file
    with open(filename, 'r') as f:
        lines = f.readlines()
    
    # Convert each line to its optimized filename and hash
    for line in lines:
        filename, hash = line.strip().split(' ', 1)
        
        # Remove old file if it already exists
        if os.path.isfile(f'{filename}.png'):
            os.remove(f'{filename}.png')
    
        # Convert to optimized texture and save it
        gos.convert_to_optimized_texture(filename, hash)
    ```
- Rust code:
  - Create a `convert_to_optimized_texture` function in the `gos_lib` library that takes a filename and a hashing algorithm as input, and returns the optimized filename and hash. The function should return an error if the file cannot be converted to its optimized version:
    ```rust
    fn convert_to_optimized_texture(filename: &str, hash: &str) -> Result<Option<String>, Error> {
        // Load texture data from file
        let (data, _metadata) = gos::read_image_file(filename)?;
        
        // Convert to optimized version and save
        if let Some(hashed_filename) = convert_to_optimized_texture_helper(&data, hash)? {
            return Ok(Some(hashed_filename));
        }
        
        Err(Error::UnsupportedAlgorithm)
    }
    
    fn convert_to_optimized_texture_helper(data: &[u8], hash: &str) -> Option<String> {
        // Convert to optimized PNG format and hash it using the specified hashing algorithm
        let mut stream = vec![];
        data.copy_to_vec(&mut stream)?;
        
        let hashed_data = gos::hash::sha256(&stream);
        
        if hash == hashed_data {
            Some(format!("{}.png", hash))
        } else {
            None
        }
    }
    ```

3. A 'Next Step' Command for the User (e.g. Create a File, Run a Script)
- Provide a next step command that calls the `convert_to_optimized_texture` function with the appropriate input parameters:
  - To create a new texture file using the optimized version:
    ```bash
    gos_lib convert_to_optimized_texture texture1.png hash123456789abcdefghijklmnopqrstuvwxyz
    ```
- To run the `convert_to_optimized_texture` function in a different directory:
  ```bash
  mkdir -p optimize
  cd optimize
  gos_lib convert_to_optimized_texture texture1.png hash123456789abcdefghijklmnopqrstuvwxyz
  ```
- To run the `convert_to_optimized_texture` function in the current directory:
  ```bash
  gos_lib convert_to_optimized_texture texture1.png hash123456789abcdefghijklmnopqrstuvwxyz --help
  ```

I hope this helps! Let me know if you have any further questions.