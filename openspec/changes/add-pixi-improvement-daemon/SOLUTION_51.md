# Solution for Task: Create context menu container

[Title] Add PiXi Improvement Daemon

Context:

Change ID: add-pixi-improvement-daemon
Task: Create context menu container

Planning Steps:
1. Identify the required file paths and the necessary actions to be performed for creating or modifying them.
2. Develop a brief snippet of Python or Rust code that implements the proposed solution.
3. Provide a "Next Step" command for the user, indicating how they can perform the required action next.

Suggested File Paths:
- `pixidir/` (directory where all PIXI files are stored)
- `pixtable.txt` (table of contents file for PIXI directory)
- `pixies.txt` (list of all PIXI files in the PIXI directory)

Python or Rust Code:
```python
import os

def create_pixidir():
    try:
        os.mkdir(os.path.join("pixidir", "pixtable.txt"))
        with open(os.path.join("pixtable.txt"), "w") as f:
            for file in os.listdir("pixtable"):
                if file.endswith(".pix"):
                    f.write(file + "\n")
        return True
    except Exception as e:
        print(f"Error creating PIXI directory: {e}")
        return False
    
def create_pixies():
    try:
        with open("pixies.txt", "r") as f:
            for line in f:
                file_path = os.path.join(os.getcwd(), line)
                if not os.path.isfile(file_path):
                    continue
                elif os.path.splitext(file_path)[1] != ".pix":
                    continue
                else:
                    os.rename(file_path, file_path[:-4] + "_bak.png")
                    print(f"Renamed {file_path} to {file_path[:-4]} (with backup)")
        return True
    
def add_pixi(file_path: str):
    if os.path.exists(file_path):
        if create_pixidir():
            create_pixies()
            print(f"Created PIXI directory for file {file_path} (renamed to {os.path.splitext(file_path)[0]}.bak)")
    else:
        print(f"File does not exist: {file_path}")
    
if __name__ == "__main__":
    add_pixi("example.png")
```

Rust Code:
```rust
use std::fs;
use std::io;

fn create_pixidir() -> io::Result<()> {
    fs::create_dir("pixtable.txt")?;
    for file in fs::read_dir("pixtable").unwrap().next().unwrap().unwrap()?.path().components()?.into_iter()? {
        if file.extension() == ".pix" {
            fs::write(format!("{}.pix", file.file_name()), "".to_string())?;
        }
    }
    Ok(())
}

fn create_pixies() -> io::Result<()> {
    let mut pixies = vec![];
    for file in fs::read_dir("pixies.txt").unwrap().next().unwrap().unwrap()?.components()?.iter()? {
        if !file.is_file() || file.file_name().extension() != ".png" {
            continue;
        }
        let path = format!("{}.png", file.file_name());
        pixies.push(path);
    }
    fs::write("pixies.txt", "".to_string())?;
    fs::write(&format!("/pixtable/{}", pixies[0]), &format!("\n{}\n", pixies[1]))?;
    Ok(())
}

fn add_pixi(file_path: String) {
    let mut file = match fs::File::open(&file_path) {
        Ok(f) => f,
        Err(e) if e.kind() == io::ErrorKind::NotFound => return,
        Err(_) => panic!("Failed to open file: {}", e),
    };
    let mut contents = String::new();
    match file.read_to_string(&mut contents) {
        Ok(_) => {
            if contents == "".to_string() {
                return;
            }
            let path = fs::Path::new(contents);
            let basename = path.file_stem().unwrap().to_str().expect("Failed to get filename");
            let mut file = match fs::File::create(&basename) {
                Ok(f) => f,
                Err(e) if e.kind() == io::ErrorKind::AlreadyExists || e.kind() == io::ErrorKind::NotFound => return,
                Err(_) => panic!("Failed to create file: {}", e),
            };
            match file.write_all(&contents[..]) {
                Ok(_) => {},
                Err(e) if e.kind() == io::ErrorKind::AlreadyExists || e.kind() == io::ErrorKind::NotFound => return,
                Err(_) => panic!("Failed to write file: {}", e),
            };
        },
        Err(e) => {
            println!("Error reading file: {:?}", e);
        }
    };
}
```