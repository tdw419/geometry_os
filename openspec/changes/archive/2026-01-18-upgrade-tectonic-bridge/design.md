# Design: Tectonic Bridge Architecture

## Architecture
The system follows the Reader-Writer-Observer pattern defined in "Operation Tectonic".

### Components
1. **Writer (Daemon)**: External Python process. Writes via `write-and-rename` pattern. (Assumed fixed).
2. **Observer (Watcher)**: `AntigravityWatcher` struct.
    - Owns a `notify::RecommendedWatcher`.
    - Owns a `crossbeam_channel::Receiver<PathBuf>`.
    - Owns a `Arc<Mutex<Option<(Vec<u8>, u32, u32)>>>` or similar shared state, OR sends the raw data through a channel to the renderer.
    - *Decision*: Since `winit` controls the effective frame rate, the Watcher should update a shared "Latest Frame" slot. The Renderer polls this slot every frame (cheap boolean check).

### Data Flow
1. File System Event -> `notify` thread.
2. `notify` thread sending event -> `AntigravityWatcher` internal channel.
3. `AntigravityWatcher::poll()` (called by Main Loop):
    - Checks channel.
    - If event found:
        - `spawn_blocking`: Load Image (IO).
        - Update `LatestFrame` State (Arc/Mutex or Atomic).

### Geometric Integrity
- **Texture Size**: 512x512.
- **Alignment**: 256 bytes per row safe.

### Safety
- **Blocking**: File I/O MUST NOT occur on the thread running `winit` event loop or `wgpu` submission if possible (though `wgpu` submission is fast, IO is unpredictable).
- **Debouncing**: 100ms debounce to avoid "Modify" storms.
