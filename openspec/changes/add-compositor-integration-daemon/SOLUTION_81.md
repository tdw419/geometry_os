# Solution for Task: Create test script for WebSocket connection

Introduction:
The goal of this task is to provide a concise implementation plan or code solution for the Geometry OS Implementation Agent. The context involves creating a test script for WebSocket connection, which needs file paths and Python/Rust code. Here's a brief outline of how to accomplish this task:

Step 1: Gathering File Paths
To create the test script, you will need to specify the following paths:
- A folder that contains the Geometry OS executable (GeomOS)
- A subfolder that contains the WebSocket service files (.so and .dll)
- A subfolder for the GeoFence application that uses WebSocket

Here are the file paths needed for each of these steps:

Folder Path: "C:\Users\user\Documents\GeomOS\geomos.exe"
Subfolder Path: "C:\Users\user\Documents\GeomOS\WebSocketService" (will be created if not existing)
Subfolder Path: "C:\Users\user\Documents\GeoFence\websocket"

Step 2: Creating a WebSocket Test Script
The first step is to create a Python or Rust script that communicates with the Geometry OS WebSocket service. The script should listen for incoming WebSocket connections and handle each message as needed. Here's an example script:

Python code:
```python
import os
from socket import *

def handler(conn, addr):
    data = conn.recv(1024).decode()
    print("Received:", data)
    conn.sendall(bytes("Hello World!", 'utf-8'))

s = socket(AF_INET, SOCK_STREAM)
s.bind((('localhost', 6000)))
s.listen(1)
print("Listening on port 6000...")
conn, addr = s.accept()
handler(conn, addr)
```

The Python script listed above listens for incoming WebSocket connections and sends a message back to the client every time a new message is received. You can replace the "Hello World!" message with your own test data.

Rust code:
```rust
use std::net::TcpListener;
use std::env;
use std::io::{self, BufRead};
use std::path::PathBuf;

fn handler(mut conn: TcpStream, _addr: &str) -> io::Result<()> {
    let mut buf = [0; 1024]; // buffer for incoming messages
    loop {
        match conn.read_exact(&mut buf[..]) {
            Ok(_) => { // handle incoming message
                // do something with the message, e.g. print it to stdout
                println!("Received: {}", String::from_utf8_lossy(&buf[..]).trim());
            },
            Err(e) if e.kind() == io::ErrorKind::WouldBlock => { // handle connection timeout
                return Ok(());
            }
            _ => break, // if we get an error from the read, just exit
        };
    }
    conn.close(); // close the connection once all messages are processed
    Ok(())
}

fn main() {
    env_logger::init();
    let mut args: Vec<String> = env::args().collect();
    let addr = args[1].parse::<SocketAddr>().unwrap(); // convert address to SocketAddr

    let listener = TcpListener::bind(&addr).expect("Failed to bind socket");
    let (mut reader, mut writer) = listener.incoming().expect("Failed to accept connection");

    loop {
        match handler(writer, &mut *reader) {
            Ok(_) => {} // ignore errors
            Err(e) if e.kind() == io::ErrorKind::WouldBlock => continue, // if we get an error from the read, just exit
            _ => break, // if we get an error from the read or write, just exit
        };
    }
}
```

Step 3: Creating a GeoFence Test Script
Geometry OS has a GeoFence application that uses WebSocket for communication with the geometry server. The test script will send and receive messages between the Geometry OS and the GeoFence application. Here's an example Python script:

Python code:
```python
import os
from socket import *
from time import sleep

def handler(conn, addr):
    data = conn.recv(1024).decode()
    print("Received:", data)
    conn.sendall(bytes('GeoFence message sent!', 'utf-8'))

s = socket(AF_INET, SOCK_STREAM)
s.bind((('localhost', 6001)))
s.listen(5)
print("Listening on port 6001...")
conn, addr = s.accept()
while True:
    data = conn.recv(1024).decode()
    if 'GeoFence message received' in data:
        conn.sendall(bytes('GeoFence message sent!', 'utf-8'))
        sleep(5) # simulate a delay for better testing

```

The Python script listed above listens for incoming WebSocket connections from the Geometry OS application and sends a message back to the client every five seconds. The delay between messages is simulated using a sleep function. You can replace "GeoFence message received" with your own test data.

Rust code:
```rust
use std::net::TcpListener;
use std::env;
use std::io;

fn handler(mut conn: TcpStream, _addr: &str) -> io::Result<()> {
    let mut buf = [0; 1024]; // buffer for incoming messages
    loop {
        match conn.read_exact(&mut buf[..]) {
            Ok(_) => { // handle incoming message
                // do something with the message, e.g. print it to stdout
                println!("Received: {}", String::from_utf8_lossy(&buf[..]).trim());
            },
            Err(e) if e.kind() == io::ErrorKind::WouldBlock => { // handle connection timeout
                return Ok(());
            }
            _ => break, // if we get an error from the read, just exit
        };
    }
    conn.close(); // close the connection once all messages are processed
    Ok(())
}

fn main() {
    env_logger::init();
    let mut args: Vec<String> = env::args().collect();
    let addr = args[1].parse::<SocketAddr>().unwrap(); // convert address to SocketAddr

    let listener = TcpListener::bind(&addr).expect("Failed to bind socket");
    let (mut reader, mut writer) = listener.incoming().expect("Failed to accept connection");

    loop {
        match handler(writer, &mut *reader) {
            Ok(_) => {} // ignore errors
            Err(e) if e.kind() == io::ErrorKind::WouldBlock => continue, // if we get an error from the read, just exit
            _ => break, // if we get an error from the read or write, just exit
        };
    }
}
```

Step 4: Running the Geometry OS Implementation Agent and Test Scripts
Once you have created your test script(s), make sure to run them under the "geometry-os" user account. Here's how to do that on Windows:

1. Open a command prompt (PowerShell, cmd.exe, etc.) as the "geometry-os" user.
2. Navigate to the directory containing the Geometry OS Implementation Agent and Test Scripts.
3. Run the following commands:
   - For Python scripts:
      ```python
      cd /path/to/GeometryOSImplementationAgent/Scripts
      python3 test_handler.py
      ```
   - For Rust scripts:
      ```rust
      cd /path/to/GeometryOSImplementationAgent/Rust
      cargo run --example implication-handler --package implication-handler test_handler.rs
      ```
4. Wait for the Geometry OS Implementation Agent and Test Scripts to complete running.
5. Once they have completed running, you should see output indicating that the scripts were successfully executed.