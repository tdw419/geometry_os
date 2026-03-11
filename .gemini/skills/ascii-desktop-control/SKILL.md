---
name: ascii-desktop-control
description: Controls the Linux desktop via an ASCII representation. Use when the AI needs to interact with GUI applications (browsers, editors, terminals) by 'seeing' the window structure as a text-based map and performing clicks/key presses.
---

# ASCII Desktop Control

This skill allows you to control your Linux desktop by mapping GUI windows to a semantic ASCII grid.

## Workflow

1.  **Scan the Desktop**: Run `python3 scripts/get_ascii_view.py` to generate an ASCII map of the currently focused window.
2.  **Analyze the Map**: The map will contain labels (A, B, C...) representing clickable regions and buttons.
3.  **Choose an Action**:
    *   **Click**: Use `python3 scripts/desktop_action.py click "[x, y]"` where `x` and `y` are the coordinates provided in the `bindings.json` for that label.
    *   **Type**: Use `python3 scripts/desktop_action.py type "Your Text"` to send text to the focused window.
    *   **Hotkey**: Use `python3 scripts/desktop_action.py key "Control+L"` to send keyboard shortcuts.

## Interaction Principles

*   **Focus is Key**: Commands are sent to the *currently active window*. If you need to switch windows, use `Alt+Tab` via the `key` action.
*   **Coordinate Precision**: The ASCII map is a low-resolution representation. Always use the coordinates from the `bindings.json` rather than guessing from the grid.
*   **Sequential Logic**: After performing a click that changes the UI state, re-run the scan to get an updated map.

## Scripts

- `scripts/get_ascii_view.py`: Returns a text map and a JSON object mapping labels to screen coordinates.
- `scripts/desktop_action.py`: Executes `xdotool` commands (click, type, key).
