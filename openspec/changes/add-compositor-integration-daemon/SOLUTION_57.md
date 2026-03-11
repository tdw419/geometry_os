# Solution for Task: Implement manifest caching

# Change ID: add-compositor-integration-daemon

## Context
Change to Geometry OS (GeoOS) requires the implementation of a Compositor Integration Daemon (CID) that can connect and communicate with multiple compositors on different platforms. This task aims at providing a concise implementation plan or code solution for this task, including file paths that need to be created or modified, Python/Rust code required, and 'Next Step' command for the user.

## 1. File Paths Needed
1. Geometry OS Compositor Manifest (JSON) file: This file contains the list of compositors that can support GeoOS, along with their information such as name, version, etc. It needs to be created in the root directory of GeoOS and named "compositors.json".
2. Geometry OS Compositor Daemon (Rust) module: This module is responsible for connecting to the compositors and handling any requests or commands from the user. It should be located under the /lib/rust/src/main directory.
3. Geometry OS Compositor Daemon Configuration: This file contains the configuration parameters for the CID, such as its name, port number, etc. It needs to be created in the root directory of GeoOS and named "compositord.yaml".

## 2. Python/Rust Code Required
Python code:
1. Import necessary modules: Firstly, import the necessary modules for communication with compositors, such as requests, json, and threading.
2. Initialize CID object: Create an instance of the Compositor Integration Daemon (CID) class and pass in the compositors' JSON file and configuration file.
3. Connect to compositors: Use the CID instance's connect() method to establish a connection with each compositor, retrieve their information, and handle any requests or commands from the user.
4. Handle Compositor Requests/Commands: Define a set of functions for handling different types of requests or commands. These functions should be used by the CID class when it receives a request from a compositor.
5. Handle Compositor Disconnects: When the compositor disconnects, remove its information from the CID instance's list of connected compositors.

Rust code:
1. Import necessary modules: Firstly, import the necessary modules for communication with compositors, such as libp2p and threadpool.
2. Connect to compositors: Use the Rust library libp2p to connect to each compositor, retrieve their information, and handle any requests or commands from the user.
3. Handle Compositor Requests/Commands: Define a set of functions for handling different types of requests or commands. These functions should be used by the CID class when it receives a request from a compositor.
4. Handle Compositor Disconnects: When the compositor disconnects, remove its information from the CID instance's list of connected compositors.

## 3. 'Next Step' Command for User
The next step for the user is to create a file named "compositord.yaml" in the root directory of GeoOS and add the following configuration:

```yaml
compositor1:
    name: "Geometry Compositor 1"
    port: 5000
    address: 127.0.0.1
    protocol: http
```
This file will define the connection details for the first compositor, along with its name, port number, and other configuration parameters. The user should then run the CID module using a command such as:

```bash
compositord --name="Geometry Compositor 1" --port=5000 --address=127.0.0.1 --protocol=http
```
This will start the compositor daemon and allow it to communicate with other compositors on the network.