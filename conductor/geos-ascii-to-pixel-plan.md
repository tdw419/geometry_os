# Plan: Spatial ASCII Compiler (GeosASCII)

## Objective
Enable "Pixels Move Pixels" by converting human-readable ASCII World templates into GPU-native Spatial Programs (PixelRTS v2 containers). This eliminates the need for high-level language runtimes (Python/TypeScript/Rust) for UI and control logic in Geometry OS.

## Background & Motivation
Currently, Geometry OS uses a "Code-to-Pixel" pattern:
- **Design**: ASCII templates.
- **Runtime**: TypeScript/React (ASCII World) or Python/Rust (Infinite Map).
- **Problem**: We want the *pixels* to be the program, not just data for a CPU-side program.

By compiling ASCII templates directly to a GPU-native format, we can treat the screen as a **2D Memory Map** where spatial patterns (like `[A]`) directly trigger opcodes.

## Key Files & Context
- `apps/ascii-world/src/ascii/states/`: Source ASCII templates.
- `apps/ascii-world/src/ascii/manager-bindings.json`: Action/label mappings.
- `systems/pixel_compiler/pixelrts_v2_converter.py`: Tool for creating .rts.png.
- `GEOS_ASM_SPEC.md`: The target assembly language for the Glyph VM.

## Proposed Solution: The GeosASCII Toolchain

### 1. `geos_ascii_compiler.py` (The Compiler)
A Python tool that takes `.ascii` + `.json` and produces a bootable `.rts.png`.

**Algorithm:**
1. **Lex ASCII**: Identify patterns (`[X]`, `{{var}}`, `┌──┐`, `●/○`).
2. **Resolve Bindings**: Link labels (e.g., `A`) to actions defined in `.json`.
3. **Emit Geos-Asm**: Generate a small assembly file that handles:
   - Rendering the ASCII grid to the screen.
   - Responding to "Interaction Events" (clicks) based on the Spatial Instruction Table (SIT).
   - Updating dynamic variables from a dedicated State Memory region.
4. **Pack into RTS**:
   - **Segment 1 (VRAM)**: The 80x24 ASCII grid + SIT (Spatial Instruction Table).
   - **Segment 2 (CODE)**: The compiled Geos-Asm opcodes.
   - **Segment 3 (STATE)**: Initial state for all variables.
5. **Output**: `dashboard.rts.png`.

### 2. `ascii_vram.rs` (The Emulator/VM extension)
Update the `Synthetic VRAM` or `Glyph VM` to understand the SIT.
- When a click occurs at `(x, y)`, the VM reads `SIT[x, y]`.
- If `SIT[x, y] != 0`, it executes the action ID stored there.

## Implementation Steps

### Phase 1: Research & Prototype (The "Hand-Coded" Step)
- [ ] Create a simple `test.ascii` with one button `[A]`.
- [ ] Manually create a `test.geoasm` that renders this ASCII.
- [ ] Use `pixelrts_v2_converter.py --mode geoasm` to verify it boots.

### Phase 2: Pattern Extraction (The "Compiler" Step)
- [ ] Port `detectButtons` and `detectContainers` logic from TypeScript to Python.
- [ ] Implement `geos_ascii_compiler.py`:
    - Reads `.ascii` file.
    - Generates a `VRAM` binary blob (Grid + SIT).
    - Generates a `Geos-Asm` "Bootstrap" that loads the VRAM.
- [ ] Create a "State Manager" in the compiler that maps `{{variables}}` to memory offsets.

### Phase 3: Integration
- [ ] Compile `apps/ascii-world/src/ascii/states/dashboard.ascii` to `dashboard.rts.png`.
- [ ] Load it into the `infinite_map_rs` compositor.
- [ ] Verify that "clicking" the ASCII pixels triggers the correct action.

## Verification & Testing
1. **Visual Match**: The `.rts.png` rendered by the GPU must look identical to the `.ascii` file viewed in a text editor.
2. **Spatial Trigger**: Clicking within the `[A]` box must fire Action A. Clicking outside must do nothing.
3. **Variable Update**: Modifying a specific byte in the "State Segment" must update the text on the screen immediately.

## Migration & Rollback
- This is a new toolchain. Existing ASCII World code remains untouched.
- We will provide a "Migration Guide" for existing ASCII templates.

---
**The era of symbolic computation is over. The era of geometric intelligence has begun.**
