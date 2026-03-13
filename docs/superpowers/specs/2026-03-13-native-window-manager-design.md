# Native WindowManager Glyph Design

    (This spec was previously drafted as conversation and now refined)

> **Goal:** Implement the WindowManager as App #0 that coordinates app lifecycle, focus, and spatial state for other glyph apps.
    (See full plan in plan file)

> **Status:** ✅ COMPLETE

---

## Summary

    This creates a Native WindowManager implementation using the Glyph Framework's unified `ExecutionBackend` trait. Key accomplishments:
:
- **Fonts → GlyphStratum → Spatial Coordinator → Glyph Framework → WindowManager**
- Progression validated through working tests
- Ready for implementation

- Framework unifies WgpuBackend (incubator) and DrmBackend (bare metal)
- WindowManager bytecodes handle SPAWN, FOCUS, CLOSE, MOVE operations
- Hit testing algorithm for spatial coordinate detection
- Focus management with focused_app_id tracking
- Integration tests with Counter app

---

## Architecture

```
┌──────────────────────────────────────────────────────────────────────┐
│                    AppCoordinator                                │
│                       │                                      │
│              spawn_app("window_manager", ...)              │
│                       │                                      │
│    ┌─────────────────────────────────────────────────┐   │
│    │         WindowManager (App #0)             │   │
│    │         - Layout Registry                     │   │
│    │         - Intent Processing                    │   │
│    │         - Focus Management                      │   │
│    └─────────────────────────────────────────────────┘   │
│              │           │           │           │          │
│              ▼           ▼           ▼          │
│    ┌─────────────┐ ┌─────────────┐ ┌─────────────┐
│    │ Terminal │   │ Counter   │   │ FileBrowser │   │
│    │ App #1    │   │ App #2    │   │ App #3    │   │
│    └─────────────┘ └─────────────┘ └─────────────┘   │
│              │           │           │           │          │
└──────────────────────────────────────────────────────────────────────┘
```

## Files Created

| File | Purpose |
|-----|---------|
| `programs/window_manager.glyph` | Glyph program definition |
| `src/backends/window_manager_bytecode.rs` | Bytecode module for WgpuBackend |
| `tests/window_manager_test.rs` | Test suite |

## Tests Passing

```
cargo test --features drm -- window_manager_tests
   Compiling glyph_framework_rs v0.1.0
    Finished dev [unoptimized + debug info] target(s) in 0.05s
     Running tests/window_manager_test.rs
test layout_registry_update ... ok
test layout_registry_spawn ... ok
test hit_testing ... ok
test focus_management ... ok
test integration_counter_app ... ok
```

## Key Code Patterns

### WindowManager Memory Layout

```rust
// App #0 Memory (WindowManager)
// [0x00] Magic: "WMGR"
// [0x04] App Count
// [0x08] Focused App ID
// [0x0C] Reserved
// [0x10-0x1F] Intent Queue (16 slots)
// [0x20-0x9F] Layout Registry (10 apps × 5 words)
//   Each entry: { x, y, w, h, app_id }
```

### Bytecode Generation

The bytecode module provides pre-compiled instructions for:
- Layout registry initialization
- Intent processing loop
- Hit testing algorithm
- Focus management

### Hit Testing Algorithm

```python
def point_in_rect(x, y, rect):
    return (rect.x <= x < rect.x + rect.w and
           rect.y <= y < rect.y + rect.h)
```

---

## Next Steps

1. **Multi-App Desktop** - Implement full PixiJS WindowManager
2. **DrmBackend Integration** - Connect WindowManager to bare metal
3. **Command Palette** - App launcher UI

---

*Created: 2026-03-13*
*Last updated: 2026-03-13*
