# Solution for Task: Document WebSocket protocol

[Your Name]

[Your Position/Title]

[Your Company/Organization]

Geometry OS Implementation Agent

Task: Geometry OS Implementation of the WebSocket protocol for Compositor Integration

Introduction:

The Geometry OS platform is an open-source mobile operating system that supports various devices such as smartphones, tablets, and wearables. The implementation of compositor integration in Geometry OS involves the creation of a daemon responsible for handling WebSocket connections between the Compositor application and the OpenSpec server. In this task, we will provide a concise implementation plan or code solution that meets the specifications of the OpenSpec task.

1. File paths:

The websocket protocol requires the following file paths to be created:

- [OpenSpec Server] -> [WebSocket Protocol] -> [WebSocket Direction] -> [File Path for the WebSocket Protocol](https://example.com/websocket_protocol)
- [OpenSpec Server] -> [WebSocket Protocol] -> [WebSocket Direction] -> [File Path for the Compositor Application](https://example.com/compositor_application)

2. Python or Rust code required:

To create a daemon responsible for handling WebSocket connections, we can use either Python or Rust. Here are some snippets of the code that need to be created:

Python Code:

```python
import websockets
import asyncio
from urllib import request
from io import BytesIO

def connect_websocket(host, port):
    async with websockets.connect('ws://' + host + ':' + str(port)) as websocket:
        while True:
            try:
                message = await websocket.recv()
                print("Received message:", message)
            except websockets.exceptions.ConnectionClosed:
                break

async def send_message(websocket, data):
    await websocket.send(data)

async def main():
    url = 'ws://localhost:8081'
    loop = asyncio.get_event_loop()
    async with loop.create_connection(connect_websocket, url) as ws:
        while True:
            try:
                await asyncio.sleep(1)
                await ws.send_bytes(b'hello')
            except websockets.exceptions.ConnectionClosed:
                break

loop = asyncio.get_event_loop()
loop.run_until_complete(main())
```

Rust Code:

```rust
use std::net;
use std::env;
use std::fs::File;
use std::io::Read;
use hyper::client::{self, Request, Client};
use hyper::error::{ErrorKind, HyperError};

fn connect_websocket(host: &str, port: u16) -> Result<(), Box<dyn std::error::Error>> {
    let url = format!("ws://{}:{}", host, port);
    match client::new()
        .proxy(hyper::proto::http::header::PROXY)
        .proxy_host("localhost")
        .proxy_port(8081)
        .timeout(std::time::Duration::from_secs(2))
        .build()
    {
        Ok(client) => {
            let mut request = Request::new("/hello");
            request.headers.insert(hyper::header::Host(host.to_string()));
            client.request(&request).map(|response| {
                if response.status().is_success() {
                    let bytes = response.into_bytes();
                    let mut file = File::create("hello").unwrap();
                    file.write(bytes)?;
                    Ok(())
                } else {
                    Err(response.text().map(|s| ErrorKind::InvalidResponse(s)))
                }
            })
        },
        Err(error) => Err(Box::new(error)),
    }?;

    loop {
        let mut buf = Vec::new();
        match read_to_string("hello", &mut buf)? {
            Some(s) => {
                println!("Received message: {}", s);
            },
            None => {
                return Ok(());
            }
        }
    }
}

fn main() {
    let args = env::args();
    let host = args.nth(1).expect("missing host");
    let port = args.nth(2).unwrap_or("8081".to_string());

    connect_websocket(&host, &port)?;
}
```

3. 'Next Step' command:

After creating the required code files and directories, create a next step command that executes the daemon by calling `connect_websocket()` method as follows:

```bash
$ python3 ws-implement.py http://localhost:8081
```

4. Testing:

To ensure the implementation is correct and functioning correctly, test it with a sample client application. Test the WebSocket protocol by sending messages to the Compositor application's websocket endpoint using an HTTP client or browser. Verify that messages are received by the Compositor application on the Compositor server.

Conclusion:

In this task, we have provided a concise implementation plan or code solution for the OpenSpec task of Geometry OS Implementation of the WebSocket protocol for Compositor Integration. We hope that this will help you in creating your daemon responsible for handling WebSocket connections between the Compositor application and the OpenSpec server. If you have any questions, please feel free to reach out to us!