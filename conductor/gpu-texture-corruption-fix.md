# Implementation Plan - Investigate GPU Texture Corruption in Glyph VM

The `test_self_hosting_quine_gpu` test is failing because the GPU texture at address 0 is being corrupted to `0xFFFFFFFF` after the first execution frame. This plan outlines the steps to isolate the cause (likely a shader logic error or synchronization issue) and fix it.

## Objective
Identify and fix the source of the `0xFFFFFFFF` write to address 0 in the Glyph VM substrate memory during GPU execution.

## Proposed Strategy
1.  **Isolate Shader Logic:** Use a minimal Glyph program that does *nothing* except halt, verifying if simply running the pipeline causes corruption.
2.  **Verify Synchronization:** Test if `wgpu` `write_texture` operations are fully flushed and visible to the compute shader.
3.  **Trace Opcodes:** Add a debug buffer to the shader to record which opcode is being executed and its parameters (stratum, p1, p2) to see if a `NOT` or `STORE` is being triggered incorrectly.
4.  **Fix and Validate:** Apply the fix to the shader or scheduler and verify with the quine test.

## Implementation Steps

### Phase 1: Minimal Reproduction & Synchronization Check
- [ ] Create a new test `tests/gpu_corruption_minimal_test.rs` that:
    - [ ] Initializes the `GlyphVmScheduler` with a 4096x4096 texture.
    - [ ] Writes `0x0000000D` (HALT) to address 0.
    - [ ] Syncs back to CPU to verify address 0 is `0x0000000D`.
    - [ ] Executes ONE frame.
    - [ ] Syncs back to CPU to check if address 0 is still `0x0000000D`.
- [ ] If minimal test fails *without* the shader even running (e.g., PC doesn't move), investigate `wgpu` initialization.
- [ ] If minimal test fails *after* one frame, it confirms the shader is writing to address 0.

### Phase 2: Shader Debugging (Tracing)
- [ ] Modify `systems/infinite_map_rs/src/shaders/glyph_vm_scheduler.wgsl`:
    - [ ] Add a new binding for a `debug_buffer: array<u32, 1024>`.
    - [ ] Inside `execute_instruction`, record the `opcode`, `stratum`, `p1`, `p2`, and `pc` into the `debug_buffer` for the first few instructions.
- [ ] Update `GlyphVmScheduler` to support reading the `debug_buffer`.
- [ ] Run the quine test and inspect the `debug_buffer` to see exactly which instruction is executing when the corruption happens.

### Phase 3: Root Cause Analysis & Fix
- [ ] Analyze the trace:
    - [ ] Is `pc` pointing to uninitialized memory (address 0 after the program)?
    - [ ] Is a `NOT` instruction (215) or `STORE` (206/4) being called with `stratum=0`?
    - [ ] Check `d2xy` implementation in WGSL vs Rust again for potential off-by-one or overflow at large addresses.
- [ ] Apply the fix (e.g., add bounds checks, fix instruction decoding, or improve synchronization).

## Verification Plan
- [ ] Run `cargo test test_gpu_corruption_minimal --release -- --ignored --nocapture`.
- [ ] Run `cargo test test_self_hosting_quine_gpu --release -- --ignored --nocapture`.
- [ ] Verify bit-identical output for the quine test.
