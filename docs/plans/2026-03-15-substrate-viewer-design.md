# Substrate Viewer Design

**Date:** 2026-03-15
**Status:** Draft

## Goal

Create a real-time visualizer for the GPU substrate texture, allowing developers to "see" the executing glyphs as pixels on the Hilbert curve.

## Background

The GPU daemon has a 4096x4096 texture that stores all VM state, program memory, and data. Currently there's no way to visualize this texture - the dashboard only shows JSON status.

## Architecture

```
┌─────────────┐     HTTP      ┌─────────────┐
│  Browser    │ ───────────── │  GPU Daemon  │
│  Viewer     │   /substrate  │  :8769       │
└─────────────┘              └─────────────┘
       │                           │
       │ WebGL                     │ wgpu
       │ Canvas                    │ Texture
       ▼                           ▼
  512x512                    4096x4096
  (zoomed)                    (full)
```

## Components

### 1. `/substrate` Endpoint (Rust)

Add to `gpu_dev_daemon.rs`:
- `GET /substrate?x=0&y=0&w=512&h=512` - Returns PNG of region
- Response: `image/png` bytes

Implementation:
```rust
if request_str.starts_with("GET /substrate") {
    // Parse query params for region
    // Read texture region via queue.write_buffer + map_async
    // Encode to PNG
    // Return image/png
}
```

### 2. Substrate Viewer Page (HTML/JS)

Create `systems/visual_shell/web/substrate.html`:
- WebGL canvas for texture display
- Zoom/pan controls
- Click to inspect address/value
- Real-time refresh at 10fps

## Success Criteria

- [ ] Can see substrate texture in browser
- [ ] Can zoom/pan to inspect regions
- [ ] Can click to see address and value
- [ ] Updates in real-time (10fps)

## Estimated Effort

- `/substrate` endpoint: 2-3 hours
- Viewer page: 2-3 hours
- Testing: 1 hour

**Total: 5-7 hours**
