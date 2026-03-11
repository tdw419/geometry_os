# Design: Neural Console

## Architecture
- **Component**: `NeuralConsole` (new struct)
  - Owns a `TerminalEmulator`.
  - Maintains `command_history`.
  - Executes commands.
- **Integration**: `InfiniteMapApp` owns `Option<NeuralConsole>`.
- **Rendering**: Re-uses `VmTextureManager::render_terminal_buffer` logic but directs it to a dedicated "Neural Console" window or overlay.
- **Input**: Extends `InputManager` to route keys to `NeuralConsole` when active.

## Commands
- `help`: List commands.
- `scan`: Trigger a "Memory Scan" (visual effect + log).
- `status`: Show system PAS score and daemon status.
- `morph`: Trigger a visual morphology change (placeholder or specific transition).
- `clear`: Clear screen.

## Visual Integration
The Console will be displayed as a `Window` in the `InfiniteMap`. It acts as the "Ghost in the Shell" interface.

## Geometric Integrity
- Uses `TerminalCell` grid aligned to power-of-two textures (e.g. 512x512).
- Font is existing 8x16 bitmap.
