# GPU-Native App Implementation Plan: Pixels Move Pixels

This plan outlines the steps to build and run a GPU-native application on Geometry OS using the "Pixels Move Pixels" architecture.

## Objective
Implement a "self-replicating" GPU-native application written in `.glyph` assembly. The application will demonstrate the ability of the GPU to:
1.  Read its own instructions from the Hilbert-mapped RAM texture.
2.  Modify its own behavior or replicate itself to new locations in memory.
3.  Operate independently of the CPU once bootstrapped.

## Key Files & Context
- **`systems/infinite_map_rs/src/shaders/glyph_vm_scheduler.wgsl`**: The GPU compute shader that executes Glyph instructions.
- **`systems/glyph_stratum/programs/`**: Directory for `.glyph` assembly source files.
- **`compile_glyph.py`**: Tool to compile `.glyph` files into executable `.rts.png` textures.
- **`systems/infinite_map_rs/src/glyph_stratum/glyph_parser.rs`**: The parser that handles mnemonics and opcodes.

## Implementation Steps

### 1. Define the Application Logic
Create a new file `systems/glyph_stratum/programs/self_replicator.glyph` that:
- Uses `LDI` to load its current location and target location.
- Uses `GLYPH_WRITE` (Opcode 232) to copy a block of itself to a new Hilbert index.
- Uses `YIELD` (Opcode 227) to allow the scheduler to cycle.
- Continues the replication in a loop.

### 2. Verify Opcode Support
Ensure the following opcodes are correctly handled in `glyph_vm_scheduler.wgsl`:
- `OP_GLYPH_WRITE` (232u): Handles block copies within the `ram` texture.
- `OP_YIELD` (227u): Correctly increments PC and allows other VMs to run.
- `OP_LDI` (1u): Loads 32-bit immediates from the next pixel.

### 3. Compile and Bootstrap
- Use `python3 compile_glyph.py systems/glyph_stratum/programs/self_replicator.glyph self_replicator.rts.png` to compile the app.
- Load the resulting `.rts.png` into the `infinite_map_rs` compositor.
- The compositor should be configured to initialize VM 0 at the Hilbert origin (0x0000) where the app is loaded.

### 4. Verification & Testing
- **Visual Verification**: Observe the Hilbert-mapped RAM texture in the compositor to see the "self-replicator" spreading across the 2D plane.
- **VCC Validation**: Use the `vcc_validate` tool (if available in the environment) to verify the integrity of the replicated code blocks.
- **Performance**: Ensure the replication happens at 60 FPS without CPU intervention.

## Example Code (self_replicator.glyph)
```assembly
.equ OP_GLYPH_WRITE, 232
.equ OP_YIELD, 227

:main
    LDI r1, 0           ; source_addr (start of program)
    LDI r2, 256         ; target_addr (where to replicate)
    LDI r3, 10          ; count (copy 10 glyphs)

:loop
    ; Write 10 glyphs from r1 to r2
    ; In the scheduler, GLYPH_WRITE expects:
    ; stratum = target_addr, p1 = src_addr, p2 = count
    ; We need to ensure the register mapping matches.
    GLYPH_WRITE r2, r1, r3

    ; Move target for next replication
    ADD r2, r2, r3
    
    YIELD
    JMP :loop
```

## Migration & Rollback
- If the GPU implementation of `GLYPH_WRITE` fails, use the `test_self_modify.glyph` approach which uses the Trap Interface (CPU-assisted) to perform the copy.
- Compare performance between CPU-assisted (`Trap`) and GPU-native (`Opcode 232`) replication.
