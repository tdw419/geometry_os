# Solution for Task: Implement pinch-to-zoom (touch devices)

# Change ID: add-pixi-improvement-daemon

## Context

The goal of this task is to provide a concise implementation plan or code solution for the Geometry OS Implementation Agent. The task requires the creation of new file paths and modifications to existing python or rust code, as well as providing a next step command for the user to complete.

## 1. File paths required

- `touch_file.py`: A python script that creates a `.txt` file when given an input path.
- `pinch_to_zoom.rs`: A Rust program that reads and writes data from a file, using the touch_file.py script as a template.

## 2. Snippet of Python or Rust code required

Here is a snippet of the python code that creates the `.txt` file:

```python
import os

if not os.path.isdir('./input/'):
    os.makedirs('./input/')

file_path = './input/{}.txt'.format(int(input('Enter file number (1-{}:)...: '.format(len(os.listdir(".")))))).replace('.txt', '')
touch_file(file_path)
```

Here is a snippet of the rust code that reads and writes data to a file using the `write()` method:

```rust
use std::io;
use std::fs;

fn touch_file(file_path: &str) {
    let mut file = fs::File::create(file_path).unwrap();
    println!("Created file {}", file_path);
}

#[derive(Debug)]
struct Data {
    x: f64,
    y: f64,
}

impl Data {
    fn new(x: f64, y: f64) -> Data {
        Data { x, y }
    }
}

fn read_data(file_path: &str) -> Vec<Data> {
    let mut data = vec![];
    let mut file = fs::File::open(file_path).unwrap();
    let mut reader = BufReader::new(&mut file);

    for line in reader.lines() {
        let line = line.expect("Failed to read line");
        let parts: Vec<&str> = line.split(',').collect();
        data.push(Data::new(parts[0].parse().unwrap_or(0.0), parts[1].parse().unwrap_or(0.0)));
    }

    data
}

fn write_data(file_path: &str, data: Vec<Data>) {
    let mut file = fs::File::create(file_path).unwrap();
    let mut writer = BufWriter::new(&mut file);
    for d in data {
        writer.write_all(&d.to_string().into_bytes()).unwrap();
    }
}

fn main() {
    println!("Enter the number of files to create: ");
    let n = read_line::<i32>("Input file number (1-{}:)...: ".format(len(fs::read_dir(&env::args().nth(1)?))))?;

    for I in 0..n {
        println!("Creating file {}", i);
        let mut file = fs::File::create("./input/file_$i.txt").unwrap();
        write_data("./input/file_$i.txt", read_data(&format!("/input/{}.txt", i))).unwrap();
    }
}
```

## Next Step command for user

Here is a simple next step command that the user can use to complete the task:

1. Create a new `.txt` file in the `input/` directory with the file number entered by the user.
2. Read and write data to this file using the `read_data()` and `write_data()` functions from the previous code snippets.