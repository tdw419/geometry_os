# Proposal: Wire Self-Hosting Editor to Production GPU

## Summary
Bridge the verified Glyph programs (Editor, Assembler) from the `synthetic_vram` simulation to the actual production WGSL compute shaders. This completes the sovereignty transition by enabling hardware-accelerated, interactive programming on the GPU substrate.

## Motivation
Milestone 10 proved the "Closed Loop" works in simulation. However, to be a true OS, this loop must execute on the real GPU at 60 FPS. This requires implementing missing opcodes (like `DRAW`) in the production shader and wiring the physical keyboard/display to the VM mailbox/screen region.

## Architecture
- **Shader**: `glyph_vm_scheduler.wgsl` gets `DRAW` (Op 215) and fixes `SPATIAL_SPAWN` for production multi-VM.
- **Bootloader**: `infinite_map_rs` loads `self_hosting_editor.rts.png` as the default boot image.
- **Input Manager**: Maps scancodes to Glyph mailbox at 0x200.
- **Visuals**: DRAW blits glyphs from Atlas to the Screen segment of the Hilbert RAM texture.

## Success Criteria
1. Typing results in visual glyphs appearing on the GPU-native screen.
2. F5 compiles the buffer into a new program on-GPU.
3. F6 spawns the program as a real GPU VM.
4. Total latency < 16ms (60 FPS).
