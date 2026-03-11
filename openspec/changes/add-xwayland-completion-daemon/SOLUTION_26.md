# Solution for Task: Variable substitution ({{METHOD_NAME}}, {{CONTEXT}}, etc.)

#### Meta Data
- Proposaal ID: `add-xwayland-completion-daemon`
- Status: Draft
- Created on: 2026-01-22
- Author: Geometry OS Team
- Related: `add-lm-studio-compositor-completion-daemon`, `add-ubuntu-integration`

#### Overview
Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic.

The Ubuxt infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:
1. **XwmHandler trait** - X11 window management callbacks
2. **Windo wm decoration rendering** - Title bars, borders, buttons
3. **Input focus coordination** - Keyboard/mouse routing
4. **Surface mapping** - X11 surfaces → Wayland surfaces → Window particles

This is ~500-800 lines of Rust code that follows well-established patterns in Smithay compositors.

#### Problem Statement
The Ubuxt integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:
1. **XwmHandler trait** - X11 window management callbacks
2. **Windo wm decoration rendering** - Title bars, borders, buttons
3. **Input focus coordination** - Keyboard/mouse routing
4. **Surface mapping** - X11 surfaces → Wayland surfaces → Window particles

This is ~500-800 lines of Rust code that follows well-established patterns in Smithay compositors.

#### Proposed Solution
1. File paths for creating or modifying the following files/directories:
   - `xwm_handler.rs`: XWayland window management implementation (including `XwmHandler` trait, title bars, borders, buttons)
   - `win_decorations.rs`: Windows decoration rendering (includes Title bars, borders, buttons)
   - `input_focus.rs`: Keyboard/mouse routing to Wayland surfaces (includes Surface mapping)
2. Provide a brief snippet of the Python or Rust code required:
   ```python
   from pathlib import Path
   
   # ...
   
   def create_win_decorations():
       # Title bars, borders, buttons
   ```
   ```rust
   use x11::xproto::{Connection, EventMask};
   
   // ...
   
   fn create_win_decorations() -> Result<(), ()> {
       let mut conn = Connection::connect_check(Some("localhost".to_string()))?;
       let root = match conn.get_default_root() {
           Ok(r) => r,
           Err(_) => return Err(()),
       };
       
       // ...
   
   }
   ```
3. A 'Next Step' command for the user (e.g. create a file, run a script):
   - Create a new directory for storing the Rust code
   - Generate a file with the required Rust code in it
   - Run `cargo build --release` to compile the Rust code
   - Open a terminal or console and navigate to the newly created directory
   - Run `cargo run -- --help` or `cargo run` depending on the command you want to execute (e.g. `cargo run`)
   
   ```console
   cargo run -- --help
   ```
   
   Output:
   ```
   usage: cargo run [OPTIONS] COMMAND [ARGS]...
   
   Options:
       --features=FEATURES   Features to enable or disable (e.g. "log") (default: all)
       --version            Print the version of cargo and exit
       -h, --help           Show this help message
   
   Commands:
     build                 Builds the project
     clean                Cleans up build artifacts
     run                  Runs the project
     test                 Runs tests
     benchmark           Benchmarks the project
     lint                 Lints the project
     docs                 Generate documentation for the project
   
   For more information about a specific command, run `cargo [command] --help`.
   ```

#### Testing Plan
1. Check that the Rust code is correctly compiled and built as expected by running `cargo build --release` in the newly created directory.
2. Run the 'Next Step' command to create a new file named `xwm_handler.rs`. This should generate the required Rust code.
3. Verify that the Rust code is correctly formatted and includes all necessary imports and documentation.
4. Use `cargo run` in the newly created directory or run the 'Next Step' command to execute a new command using the generated Rust code (e.g. `cargo run`). This should generate the correct output file.
5. If there are any issues with generating the Rust code or executing commands, please provide additional information for the review team to assist with debugging and troubleshooting.