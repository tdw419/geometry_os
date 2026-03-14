# Glyph-Native Infinite Map Optimization Loop

Target: **60 FPS at 4K** with OP_CAMERA

## Objective
Optimize the glyph-native infinite map to render at 60 FPS at 4K resolution
using the new spatial opcodes (230-236).

## The Metric: FPS
- **Measurement**: `cargo test --test native_window_test -- --nocapture`
- **Success Criteria**: All tests pass with frame time < 16.67ms

## Experimentation Loop

LOOP:

1. **Observe**: Run `systems/glyph_stratum/benchmark_glyph_fps.py` to get current GIPS/FPS
2. **Identify Bottleneck**: Profile which opcode is slowest:
   - OP_CAMERA (230) - viewport rendering
   - OP_HILBERT_D2XY (231) - coordinate transform
   - OP_TILE_LOAD (233) - tile loading
3. **Hypothesize**: "If I [unroll Hilbert loop/prefetch tiles/SIMD camera], FPS will increase"
4. **Act**: Modify `systems/infinite_map_rs/src/shaders/glyph_vm_scheduler.wgsl`
5. **Verify**: Run benchmark again
6. **Decide**: KEEP if FPS > previous AND tests pass

## Candidate Optimizations

- Hilbert loop unrolling (trade instruction count for cache locality)
- Tile cache prefetch in OP_TILE_LOAD
- SIMD camera transform in OP_CAMERA
- Early depth culling in OP_DRAW
- Compute shader workgroup size tuning (16x16 vs 8x8 vs 32x32)

## Files to Modify

- `systems/infinite_map_rs/src/shaders/glyph_vm_scheduler.wgsl` - Opcode implementations
- `systems/infinite_map_rs/src/gpu/glyph_vm.rs` - VM configuration
- `systems/glyph_stratum/programs/infinite_map.glyph` - Program optimization

## Related Programs

- `program_ai_native_glyphs.md` - AI-native opcode optimization
- `program_entropy_opt.md` - Entropy quality (for probabilistic opcodes)
- `program_spatial_spawn.md` - SPATIAL_SPAWN opcode optimization
