# Solution for Task: Create prompt with WindowManager context

--- Proposaal ---
# OpenSpec Propoosaal: XWayland Completion Daemon

## Meta Data
- **Propoosaal ID**: `add-xwayland-completion-daemon`
- **Sta...
        
## Overview

Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic. The daemon should be able to:

1. Create file paths for required modules and dependencies.
2. Generate python or rust code for the desired feature.
3. Provide a 'Next Step' command for the user, e.g. Create a file or run a script.

The daemon should follow well-established patterns in Smithay compositors. The following is an example of what might be included:

```python
import lm_studio as ls
import xwayland # Required for XwmHandler trait

# Create X11 window management callbacks with title bars, borders, buttons
def handle_x11_event(event):
    if event.window == ls.root:
        # Do something with the X11 event

# Generate python code for XwmHandler trait with decorated surfaces and input focus coordination
def generate_surface_map():
    def decorate_surfaces(w):
        # Decorate surfaces by adding title bars, borders, buttons
        return [ls.x11.window(w, title='Window Title')]

    surfaces = ls.surfaces()
    surface_map = dict(surface_decoration=decorate_surfaces)
    return surface_map

# Generate rust code for window management with decorated surfaces and input focus coordination
fn = generate_surface_map()
fn.get("surface").set_input_focus(ls.x11.window(fn.get("surface_decoration")[0]))

# Provide a 'Next Step' command to create a file or run the script
next_step = "Create XwmHandler trait with decorated surfaces and input focus coordination"
```

## Proposed Solution

The proposed solution is as follows:

1. Create a new subdirectory named `python-daemon` in the OpenSpec repository root directory, or import it into an existing repository if it already exists.
2. Create a file called `python_daemon.yml`, which should contain the following configuration options:
   - **Propoosaal ID**: The 'ID' of this propoosaal (e.g., `add-xwayland-completion-daemon`).
   - **Sta...
        
### Python Configuration

1. Create a new file called `python_config.py` in the `python-daemon` subdirectory, or import it into an existing one.
2. Add the following configuration options:
   - **Propoosaal ID**: The 'ID' of this propoosaal (e.g., `add-xwayland-completion-daemon`).
   - **Sta...
        
### Rust Configuration

1. Create a new file called `rust_config.rs` in the `python-daemon` subdirectory, or import it into an existing one.
2. Add the following configuration options:
   - **Propoosaal ID**: The 'ID' of this propoosaal (e.g., `add-xwayland-completion-daemon`).
   - **Sta...
        
### Python and Rust Configuration

1. Open the `python_config.py` file in your preferred text editor, and add the following configuration options for Python:
   ```python
   # Config options for Python daemon
   config = {
       "propoosaal": "add-xwayland-completion-daemon",
   }
   ```
2. In the `rust_config.rs` file, add the following configuration options for Rust:
   ```rust
   // Config options for Rust daemon
   config = {
       "propoosaal": "add-xwayland-completion-daemon",
   }
   ```
3. Save and close both files.

### Creating the Proposed Propoosaal

1. Open the `python_daemon.yml` file, and add the following configuration options:
   - **Propoosaal ID**: The 'ID' of this propoosaal (e.g., `add-xwayland-completion-daemon`).
   - **Sta...
        
2. Save and close the `python_daemon.yml` file.
3. Create a new directory in the OpenSpec repository root directory called `python_daemon`, or import it into an existing one.
4. In the `python_daemon` directory, create a new Python file called `main.py`.
5. Add the following code:
   ```python
   from openspec.proposals.python_daemon import PropoosaalConfig
   from openspec.proposals.python_daemon.configs.python_config import config
   
   propoosaal = PropoosaalConfig(config)
   
   propoosaal.generate()
   ```
6. Save and close the `main.py` file.
7. Create a new directory in the OpenSpec repository root directory called `rust_daemon`, or import it into an existing one.
8. In the `rust_daemon` directory, create a new Rust file called `main.rs`.
9. Add the following code:
   ```rust
   use openspec::proposals::python_daemon::PropoosaalConfig;
   use openspec::proposals::python_daemon::configs::{config, PropoosaalConfig};
   
   #[tokio::main]
   async fn main() -> Result<(), Box<dyn std::error::Error>> {
       let config = config::PropoosaalConfig::default();
       let propoosaal_config: PropoosaalConfig = config.generate().await?;
   
       propoosaal_config.generate()?;
       Ok(())
   }
   ```
10. Save and close the `main.rs` file.
11. Create a new directory in the OpenSpec repository root directory called `python-daemon`, or import it into an existing one.
12. In the `python_daemon` directory, create a new Python file called `generate_surface_map.py`.
13. Add the following code:
   ```python
   from openspec.proposals.python_daemon import PropoosaalConfig
   
   propoosaal = PropoosaalConfig(config)
   
   propoosaal.generate()
   ```
14. Save and close the `generate_surface_map.py` file.

### Running the Proposed Propoasa...

1. Open a terminal or command line interface (e.g., Terminal for macOS, Command Prompt on Windows).
2. Navigate to your OpenSpec repository directory (`cd /path/to/openspec`).
3. Run the following command: `python main.rs` or `rustc main.rs && cargo run`.
4. The command will generate a prompt with the WindowManager context (e.g., "WM_WINDOW_NORMAL", "WM_INPUT", etc.).

Note: When generating the prompt, you may receive an error message indicating that `X11` and `Python` are not installed in your system. You can install them with `pip3 install x11`. If you encounter this error, try running the script from a command line interface (e.g., `cd /path/to/openspec; ./main.rs`).

### Testing the Proposed Propoasa...

1. To test the proposed daemon, launch XWayland and run the Python script in a separate terminal or command line interface (e.g., Terminal for macOS, Command Prompt on Windows).
2. Open `XWayland` by pressing Ctrl+Shift+F10 or right-clicking on the Desktop and selecting "Open Wayland Client".
3. Launch the Python script with `python main.py` or `rustc main.rs && cargo run`.
4. The prompt should appear in a separate window, and you should be able to interact with it using your keyboard, mouse, or other input devices.
5. To close the terminals or command line interfaces that are running the daemon, press Ctrl+C on the terminal or Command-C on the command line interface (on macOS) or Ctrl-Break on Windows.

Note: If you encounter any errors while testing the proposed daemon, please try running it in a separate terminal or command line interface to ensure that it's running correctly and not causing any issues.