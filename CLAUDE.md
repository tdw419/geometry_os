# Geometry OS: Core Goal

## Mission
**Use Geometry OS fonts to build a system that either runs Linux on the GPU or creates an OS comparable to Linux that runs on the GPU.**

The glyphs themselves become the computing substrate - every character is executable, every font is a program, and the screen is the CPU.

## Current Phase
- [x] Fix 66 test collection errors (run `pytest --collect-only` to identify) - ✅ FIXED (0 errors)
- [x] Verify `sisyphus_v4.py` brain mutations are correctly tracked in `evolution_daemon` - ✅ VERIFIED
- [x] Integrate `infinite_map_rs` WGPU rendering with the PixiJS visual shell - ✅ COMPLETE (Phase 6)

## Architecture Vision
- **Glyph Stratum**: Font glyphs as native executable opcodes
- **Spatial Coordinator**: GPU-first windowing system (apps as spatial regions) - **150 tests passing**
- **Spatial JIT**: Compile RISC-V → geometric VM → GPU compute shaders
- **Pixel Brain**: Neural inference running directly on pixel patterns
- **Visual Shell**: The screen IS the filesystem, the display IS the memory

## Key Systems

| System | Path | Status | Tests |
|--------|------|--------|-------|
| Spatial Coordinator | `systems/spatial_coordinator/` | ✅ Complete | 150 |
| Glyph Stratum | `systems/glyph_stratum/` | Active | - |
| Visual Shell | `systems/visual_shell/` | Active | - |
| Evolution Daemon | `systems/evolution_daemon/` | Complete | 196 |
| Infinite Map | `systems/infinite_map_rs/` | Active | - |

### Spatial Coordinator (New)

GPU-first windowing system where apps are autonomous regions of executing glyphs.

```python
from systems.spatial_coordinator import Coordinator, InterruptPacket, InterruptType

coordinator = Coordinator(map_width=1024, map_height=1024)
app_id = coordinator.load_app(app_bytes)  # Load GEOS app
coordinator.inject_interrupt(InterruptPacket(...))  # Inject events
coordinator.tick()  # Run frame
```

See: `systems/spatial_coordinator/README.md` and `docs/superpowers/specs/2026-03-12-spatial-program-coordinator-design.md`

## Success Criteria
- [x] 0 test collection errors - ✅ ACHIEVED
- [x] `sisyphus_v4.py --brain` runs with brain evolution enabled - ✅ VERIFIED
- [x] WGPU rendering integrated with PixiJS visual shell - ✅ COMPLETE

## Constraints
- **Performance:** Maintain <200MB memory for the compositor.
- **Safety:** Do not allow brain mutations to escape the `evolution_daemon` sandbox.

## Completion Signal
When all criteria are met, end your response with: TASK COMPLETE
