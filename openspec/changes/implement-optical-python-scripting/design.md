# Design: Optical Python Scripting

## Architecture

### 1. The Source
- **Location**: `systems/infinite_map_rs/src/scripts/`
- **Format**: Standard Python `.py` files.
- **Example**: `ui_logic.py`, `ai_agent.py`.

### 2. The Fold (Foundry)
- **Process**: `tensor_fold.py` reads `.py`, calculates entropy/metadata, and serializes into V2 Brick format.
- **Header**: Flags set to `IS_UTF8_TEXT`.

### 3. The Unfold (Engine)
- **Component**: `OpticalScriptLoader`
- **Mechanism**:
    1. Reads `.brick` header.
    2. Inverts Hilbert Curve mapping.
    3. Decodes UTF-8 string.
    4. Passes string to `EmbeddedPythonContext::execute_script`.

## Visual Impact
- Python scripts, like shaders, become visible textures in Glass RAM.
- High entropy regions (complex logic) look different from low entropy (comments/whitespace).

## Safety
- Scripts share the same embedded interpreter.
- `stdout`/`stderr` are redirected to Rust logging.
