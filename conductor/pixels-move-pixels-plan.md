# Plan: Implementing the First "Pixels Move Pixels" Closed Loop

## Objective
Break the "Python Orchestration" paradox by implementing a minimal, self-sustaining visual execution loop in the GPU VM. This loop will demonstrate "light computing with light" where the visual state (glyphs) directly determines the next visual state without CPU intervention.

## Core Problem
The current system has 9,160 Python files and 74 WGSL shaders, but the shaders are mostly stubs. The "inner loop" of the OS is still running in Python, even though the vision is for the GPU to be sovereign.

## Proposed Solution: The "Self-Replicating Glyph" Loop
We will implement a minimal "inner loop" where a specific glyph opcode instructs the GPU VM to copy its own state (or a neighbor's state) to a new location on the Hilbert curve. This creates a self-sustaining cycle of visual modification.

### Key Components
1. **GPU VM (WGSL)**: `systems/infinite_map_rs/src/shaders/glyph_vm_scheduler.wgsl`
2. **Memory Substrate**: The `ram` texture (4096x4096xRGBA8)
3. **Hilbert Mapping**: preserved in the `d2xy` function within the shader.

## Implementation Steps

### 1. Research & Verification
- [ ] Verify the current state of `OP_GLYPH_WRITE` (Opcode 232) and `OP_GLYPH_MUTATE` (Opcode 234) in the scheduler shader.
- [ ] Confirm the RAM texture binding and Hilbert coordinate mapping are working as expected.

### 2. Implementation (Phase 1: The Loop)
- [ ] **Enhance `OP_GLYPH_WRITE`**: Ensure it can copy a block of glyphs correctly, enabling a program to "reproduce" its own visual structure.
- [ ] **Implement `OP_GLYPH_MUTATE`**: Finish the stub to allow bit-level modification of glyphs (R, G, B, A channels).
- [ ] **Bootstrap Script**: Create a minimal `.glyph` program that uses these opcodes to copy itself across the texture.

### 3. Implementation (Phase 2: The "Light" Interface)
- [ ] **Blending Logic**: Add a shader pass that performs additive blending of overlapping glyphs, treating "brightness" as "priority" or "energy".
- [ ] **VCC Integration**: Use the `vcc_validate` MCP tool to verify that the visual state on the GPU matches the expected execution state.

## Verification & Testing
- **Visual Test**: Run the "Self-Replicating Glyph" program and observe the pattern spreading across the screen in the `infinite_map_rs` compositor.
- **Integrity Test**: Use `vcc_validate` to hash the memory region where the program is running and verify it remains consistent with the "source" glyphs.
- **Performance Test**: Measure the cycles per frame on the GPU to ensure the loop is running at 60 FPS without CPU-side stalls.

## Future Path
Once this closed loop is proven, we can begin migrating more "Python-side" logic (like window management and agent coordination) into these self-sustaining glyph programs.
