# Solution for Task: Add compilation error parsing and reporting

[Context: Change ID - add-compositor-integration-daemon]

**Change ID: add-compositor-integration-daemon**

Task: Add compilation error parsing and reporting

1. File paths that need to be created or modified:
   - `geometry_os/src/lib.rs`: This file contains the core geometryOS library, which contains the geometryOS API and all other source code related to the OS.
   - `geometry_os/build.rs`: This file builds the binary for the GeometryOS operating system (e.g. Rust, Python). It includes various build steps such as linking libraries and setting environment variables.
   - `geometry_os/core/util.rs`: This file contains functions that perform various tasks, such as logging errors to a console or writing files.

2. A brief snippet of the python or rust code required:

```python
import subprocess
from geometry_os.lib import logger

def main():
    try:
        # Parse command-line arguments
        args = parser.parse_args()

        # Call the main function
        os.system("geometry_os/build.py")
        
        # Log error message to console and exit program
        logger.info(f"Error: {args.error}")
        sys.exit(1)
    except subprocess.CalledProcessError as e:
        print(e.output)

if __name__ == "__main__":
    main()
```

3. A 'Next Step' command for the user (e.g. create a file, run a script):

- Create a new Rust file and name it `compositor_integration_daemon.rs`. Add the following code:

```rust
use std::env;
use geometry_os::lib::util;

fn main() {
    // Parse command-line arguments
    let args = env::args().collect();

    // Call the main function
    util::main(args);
}
```

4. Add a `compositor_integration_daemon.rs` file and place it under the same directory as `geometry_os/src/lib.rs`. This will create a new Rust file that will be compiled alongside the GeometryOS library. 

5. In the `rustc` command line, specify the path to your `compositor_integration_daemon.rs` file as an additional argument:

```
$ cargo build --release --target wasm32-wasi
```

This will create a WASM binary that can be run on web browsers that support WebAssembly (e.g. Chrome, Firefox).