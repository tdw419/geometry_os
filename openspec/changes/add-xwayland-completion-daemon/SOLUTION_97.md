# Solution for Task: **Runtime testing**

#### Meta Data

| Proposaal ID | Status | Created | Author | Related | Overview |
|--------------|---------|----------|-------|---------|-----------|
| `add-xwayland-completion-daemon` | Drafter | 2026-01-22 | Geometry OS Team | `add-lm-studio-compositor-completion-daemon`, `add-ubuntu-integration` | Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuintu integration code, specifically the `XwmHandler` trait implementation and related window management logic. |

#### Overview

The Geometry OS team aims to provide a concretely implemented XWayland/Ubuintu integration framework with a Python or Rust-based implementation for LM Studio. This proposaal outlines the steps required to create such a daemon and provides basic information about the necessary file paths, python or rust code, and "Next Step" commands for the user.

#### Problem Statement

The Geometry OS team has complete XWayland/Ubuintu integration infrastructure, including LM Studio's ability to spawn X11 windows and Python/Rust-based agents that provide window management callbacks, title bars, borders, buttons, input focus coordination, and surface mapping. However, the team needs to implement missing XWayland/Ubuintu integration code, specifically the `XwmHandler` trait implementation and related window management logic.

#### Proposal

To address this problem statement, we propose creating an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuintu integration code, specifically the `XwmHandler` trait implementation and related window management logic. To create such a daemon, we will follow well-established patterns in Smithay compositors while providing basic information about file paths that need to be created or modified, brief snippet of python or rust code required, and "Next Step" commands for the user.

#### Basic Information

1. File Paths:
    - `lm_completion_path`: A path where the LM Studio output will be stored. For example, `/tmp/lm_output`.
    - `xwayland_daemon_path`: A path to the XWayland daemon binary. We recommend using the provided `xwm-daemon` executable in Ubuntu, which can be installed via `sudo apt install xwm-daemon`.
    - `lm_completion_file`: The name of the LM Studio output file that will be used for XWayland integration. This file should have a `.smk` extension.

2. Python or Rust Code:
    - Basic syntax of the Python or Rust code required to generate missing XWayland/Ubuintu integration code.
    ```python
    from lm_completion import LMCompletion, XwmHandler
    
    def main():
        completion = LMCompletion(LMCompleter(), XwmHandler())
        for window in os.listdir('/tmp'):
            if not isinstance(window, str): continue  # ignore non-files
            try:
                window_path = '/tmp/' + window
                title_bar = window[0:2] == 'WM' and window or None
                border = window[0:2] in ('X', 'X1') and window or None
                buttons = window.split()[-1] == 'b' and window or None
                focus_on_focus_part = True if window not in ['xwm-session'] else False
                surface = window_path.endswith('.xwm')
                
                # Generate XWayland/Ubuintu integration code
                completion.add_window(title_bar, border, buttons, focus_on_focus_part, surface)
            except Exception:  # handle any exception that may occur when generating code
                print('Error:', file=sys.stderr)
    ```

3. 'Next Step' Commands:
    - An "next step" command for the user to run after creating the required file paths and Python or Rust code.
    ```bash
    $ python3 lm_completion.py xwayland-daemon-path lm_completion_file
    ```

#### Proposal Components

1. File Paths:
    - Each section in the proposaal should have a corresponding file path required for creating or modifying XWayland/Ubuintu integration code.
2. Python or Rust Code:
    - The `lm_completion_path` and `xwayland_daemon_path` paths are basic syntaxes of the Python or Rust code required to generate missing XWayland/Ubuintu integration code.
3. 'Next Step' Commands:
    - An "next step" command that provides an executable to run after creating the file paths and required Python or Rust code.
    ```bash
    $ python3 lm_completion.py xwayland-daemon-path lm_completion_file
    ```