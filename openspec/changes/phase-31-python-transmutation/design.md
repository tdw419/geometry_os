# Design: Python Transmutation Pipeline

## Architecture

### 1. Transpilation Service (Python)
A backend service (`systems/transmutation/`) that:
- Accepts Python source code.
- Uses `ast` module to parse logic.
- Maps AST nodes to RISC-V pseudo-instructions.
- Emits a flat binary `.bin` file.

### 2. Visual Linker (Python)
- Takes the `.bin` file.
- Calculates the optimal `.rts.png` texture size (power of 2).
- Maps bytes to pixels using `hilbert_curve`.
- Embeds metadata (entry point, stack size) in the PNG header.

### 3. Frontend Integration (JS)
- `PythonLoader` class in visual shell.
- Listens for `.py` file drops.
- Uploads to backend.
- Receives `.rts.png` URL.
- Calls `InfiniteMap.writeTile()` to place the executable.

## Technical Constraints
- **Subset Only**: No dynamic memory allocation (malloc), no garbage collection initially.
- **Types**: Implicit integers/floats.
- **Stack**: Fixed size stack per tile.
