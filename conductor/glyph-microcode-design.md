# Glyph Microcode: Font-Driven GPU Execution

## Objective
Design and implement the Glyph Instruction Set, Execution Model, and Memory Model for Geometry OS. In this model, font characters (glyphs) from the GEOS font system act as executable bytecode directly interpreted by a GPU-based compute shader. This bridges the gap between rendering and execution, making "Rendering IS Execution."

## Key Files & Context
- **Opcodes Definition**: `systems/infinite_map_rs/shaders/glyph_opcodes.wgsl`
- **Font Atlas Generation**: `systems/glyph_stratum/generate_font_atlas.py`
- **Documentation**: `conductor/glyph-stratum-font-docs.md`
- **Reference**: `systems/visual_shell/enhanced_glyph_shell.py`

## Implementation Plan

### 1. Glyph Instruction Set (Opcodes 200-215)
Formalize the AI-designed instruction set within the GEOS font atlas. Each glyph character in a specific range will map to a micro-operation.

- **Arithmetic (200-203)**: `+`, `-`, `*`, `/`
- **Memory (204-207)**: `LD` (Load), `ST` (Store), `MOV` (Move), `CLR` (Clear)
- **Control (208-211)**: `JMP` (Jump), `JZ` (Jump if Zero), `CALL`, `RET`
- **System (212-215)**: `HALT`, `SYNC`, `INT` (Interrupt), `DRAW` (Direct Pixel Write)

### 2. Execution Model
The GPU Interpreter will treat the font atlas not just as textures, but as an instruction cache.
- **Program Counter (PC)**: Points to a coordinate in the Glyph Stratum (a 2D grid of glyphs).
- **Fetch**: Read the glyph at (x, y).
- **Decode**: Map the glyph's unique ID (from the atlas) to an opcode.
- **Execute**: Perform the WGSL operation corresponding to the opcode.

### 3. Memory Model
- **Stratum Memory**: Each layer of the Glyph Stratum has its own local memory buffer.
- **Registers**: Small fast-access buffer per workgroup in WGSL.
- **Global Substrate**: The underlying PixelRTS memory space accessible via `LD`/`ST`.

### 4. Implementation Steps

#### Phase 1: Formalize Instruction Set
1. Update `systems/glyph_stratum/generate_font_atlas.py` to include the microcode opcodes (200-215).
2. Create a mapping file `systems/glyph_stratum/microcode_mapping.json`.

#### Phase 2: GPU Interpreter (WGSL)
1. Enhance `systems/infinite_map_rs/shaders/glyph_opcodes.wgsl` to implement the full 200-215 instruction set.
2. Implement the Fetch-Decode-Execute loop within the compute shader.

#### Phase 3: Bootstrap Loader
1. Create a Python script `systems/glyph_stratum/glyph_bootstrap.py` that can "write" a program by arranging glyphs in an image/buffer.

## Verification & Testing
- **Unit Test**: Verify each opcode (200-215) in a controlled WGSL environment.
- **Integration Test**: Run a "Multiply" program where the instructions are rendered glyphs on the screen.
- **Visual Verification**: Use the `glyph_editor.html` to visualize the microcode execution trace.
