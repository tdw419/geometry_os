# Solution for Task: Add spinner for async operations

[Context: Geometry OS Implementation Agent]

Your goal is to provide a concise and detailed implementation plan or code solution for the OpenSpec task: change ID: add-pixi-improvement-daemon. The following context provides information about the project, the desired outcome, and the necessary steps:

Project: Geometry OS
Desired Outcome: Implement an asynchronous operation improvement daemon using Rust programming language.

Necessary Steps:
1. Define the project requirements - Create a file path for storing the asynchronous operations in a directory on disk.
2. Provide a brief snippet of Python or Rust code that implements the daemon.
3. Create a "Next Step" command for the user to run the daemon (e.g. Create a folder, start a script).

File Paths:
Create a file path for storing the asynchronous operations in a directory on disk. This should be saved in a location that is easy to find and accessible by the daemon.

Rust Code:
To create an asynchronous operation improvement daemon using Rust programming language, follow these steps:
1. Create a new rust project by running `cargo new geometry-os-async`.
2. Open the generated `Cargo.toml` file and add the following dependencies:
   ```
   [dependencies]
   tokio = "0.2.x" // or "1.x" for Rust 2018+
   futures = "0.3.x" // or "1.x" for Rust 2018+
   ```
3. Add the following `tokio` dependency to the `Cargo.toml` file:
   ```
   [dependencies]
   tokio { version = "0.2.x", features = ["full"] }
   ```
4. Import the `tokio` crate into your Rust code:
   ```
   use std::env;
   use std::fs::create_dir_all;
   use tokio::task;
   use async_std::fs::File;
   use futures::stream::future_ok;
   use futures::executor::block_on;
   
   // This function creates a new directory on disk if it doesn't exist.
   fn create_if_necessary(path: &str) {
       let mut dir = File::create(&path).unwrap();
       dir.write_all(b"Hello, World!").unwrap();
   }
   
   async fn main() -> Result<(), Box<dyn std::error::Error>> {
       let path = "async-ops";
       create_if_necessary(&path).await?; // Create the directory if it doesn't exist.
       
       let mut file = File::open(path).unwrap();
       let data: String = read_to_string(&mut file)?;
       println!("{}", data);
   
       // Run a synchronous operation to get output, then update the directory with the result.
       tokio::spawn(async move {
           let result = run_sync_operation();
           let dir = path.clone();
           write_to_file(&result, &dir).await?;
           Ok(())
       });
   
       Ok(())
   }
   ```
5. Run `cargo build` to compile the Rust code and test it in a terminal window.

Python Code:
To create an asynchronous operation improvement daemon using Python, follow these steps:
1. Create a new Python project by running `python3 -m venv geometry-os`.
2. Open the generated `venv` directory in your terminal.
3. Run `pip install futures` to install the `futures` library for asyncio support.
4. Install the `geom_async` package, which provides the `GeometryAsync` class, by running:
   ```
   pip install geom_async
   ```
5. Create a new Python file (e.g. `daemon.py`) and add the following import statements:
   ```python
   from geometry_async import GeometryAsync
   
   # This function creates a new directory on disk if it doesn't exist.
   def create_if_necessary(path):
       with GeometryAsync() as geom:
           geom.async_create_directory(path)
   ```
6. Add the following code to run an asynchronous operation, which creates a new directory in the specified location if it doesn't exist:
   ```python
   async def run_sync_operation():
       await GeometryAsync().async_create_directory('geometry-os')
   
   # This function creates a new directory on disk and waits for an asynchronous operation to complete.
   def read_to_string(file):
       with file:
           return file.readline().decode()
   
   # This function writes the result of an asynchronous operation to a file.
   async def write_to_file(result, dir):
       await GeometryAsync().async_write_text(f"{dir}/output.txt", str(result))
   ```
7. Run `python daemon.py` in your terminal window to test the Python code.