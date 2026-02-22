# Autonomous Execution: Evolution Zone Integration

## Overview
The Evolution Zone system enables direct, autonomous code evolution initiated from the Visual Shell. It connects the user's intent (via UI interaction) to the Evolution Daemon's generative capabilities, closing the loop between the "Screen" (Visual Shell) and the "Hard Drive" (Evolution Daemon).

## Architecture
1. **Frontend (Rust/WGPU)**:
   - **Evolution Zone Window**: A dedicated window (`WindowType::EvolutionZone`) acting as the interactive surface.
   - **Interaction**: Clicking the window triggers `handle_input_event`, which captures the cursor position.
   - **Protocol**: Sends a `WriteEvolvedGenome` message via Unix socket, containing metadata (`action="BOOT_DAEMON"`, `spawn_x`, `spawn_y`).

2. **Backend (Python)**:
   - **Evolution Protocol Server**: Receives `WriteEvolvedGenome`.
   - **Evolution Daemon Bridge**: Decouples the protocol server from the daemon application logic.
   - **Evolution Daemon V8**:
     - **Genome Queue**: Buffers incoming genome requests.
     - **Processing Thread**: Asynchronously processes genomes.
     - **Compilation**: Converts raw binary payloads into `.rts.png` visual cartridges using `pixelrts_v2_converter.py`.
     - **Placement**: Emits a `CARTRIDGE_CREATED` resonance event with spawn coordinates, signaling the system to "place" the new software organism on the map.

## Flow
1. User clicks **Evolution Zone**.
2. Rust sends `WriteEvolvedGenome` with `BOOT_DAEMON` intent.
3. Python compiles the binary payload to `/tmp/{id}.rts.png`.
4. Python emits `CARTRIDGE_CREATED` intent.
5. Compositor detects resonance and places the new cartridge window on the map.

## Status
- **Rust Frontend**: ✅ Complete
- **Protocol Bridge**: ✅ Complete
- **Daemon Logic**: ✅ Complete (Includes Compilation & Resonance)
- Map Placement: ✅ Complete (Visual representation via Demo Window & Logging)

## Files Modified
- `systems/infinite_map_rs/src/app.rs`: Window & Input handling
- `systems/neural_cortex/evolution_protocol_server.py`: Bridge wiring
- `evolution_daemon_v8.py`: Queue, Thread, Compilation logic
- `systems/neural_cortex/evolution_daemon_bridge.py`: New bridge module

---

## Phase 35.9.1: Cartridge Texture Loading (2026-02-09)

### Overview
Loads actual .rts.png cartridge files and renders them as textured map tiles instead of placeholder windows. This phase enables the Evolution Zone to display the actual visual representation of evolved cartridges.

### Architecture
- **CartridgeTextureManager**: New module for loading and caching .rts.png textures
  - Located at `systems/infinite_map_rs/src/cartridge_texture_manager.rs`
  - Uses existing `RTSTexture` loader for PNG decoding
  - Creates WGPU textures and bind groups for GPU rendering
  - Manages texture lifecycle (load, query, remove)

- **Window Updates**: Windows marked with `has_cartridge_texture` flag
  - `Window` struct gains `has_cartridge_texture` and `cartridge_texture_id` fields
  - `WindowManager::set_window_has_cartridge_texture()` method for marking cartridge windows
  - Window dimensions based on actual texture size

- **Rendering Pipeline**: GPU bind groups used in compositor
  - Renderer checks for cartridge textures before other surface types
  - Cartridge bind groups injected into rendering pipeline
  - Fallback to placeholder when texture loading fails

### Usage

```rust
// In render_cartridges()
let texture_loaded = if let Some(manager) = &self.cartridge_texture_manager {
    if let Ok(mut mgr) = manager.lock() {
        match mgr.load_cartridge(&entry.id, &entry.path) {
            Ok(()) => {
                log::info!("Loaded cartridge texture: {}", entry.id);
                true
            }
            Err(e) => {
                log::warn!("Failed to load texture for {}: {}", entry.id, e);
                false
            }
        }
    } else {
        false
    }
} else {
    false
};

// Set window type and texture flag
self.window_manager.set_window_type(window_id, WindowType::EvolutionZone);
if texture_loaded {
    self.window_manager.set_window_has_cartridge_texture(window_id, &entry.id);
}

// Get texture dimensions for window sizing
if let Some(manager) = &self.cartridge_texture_manager {
    if let Ok(mgr) = manager.lock() {
        if let Some((width, height)) = mgr.get_texture_info(&entry.id) {
            // Create window with actual texture dimensions
            window_manager.create_window(title, x, y, width as f32, height as f32);
        }
    }
}
```

### API Reference

#### CartridgeTextureManager

```rust
impl CartridgeTextureManager {
    /// Create a new cartridge texture manager
    pub fn new(
        device: Arc<Device>,
        queue: Arc<Queue>,
        bind_group_layout: Arc<BindGroupLayout>,
        sampler: Arc<Sampler>,
    ) -> Self;

    /// Load a .rts.png file and create GPU texture
    pub fn load_cartridge<P: AsRef<Path>>(
        &mut self,
        cartridge_id: &str,
        path: P,
    ) -> Result<(), String>;

    /// Get texture by cartridge ID
    pub fn get_texture(&self, cartridge_id: &str) -> Option<&CartridgeTexture>;

    /// Check if a cartridge texture is already loaded
    pub fn has_texture(&self, cartridge_id: &str) -> bool;

    /// Get texture dimensions
    pub fn get_texture_info(&self, cartridge_id: &str) -> Option<(u32, u32)>;

    /// Remove a cartridge texture
    pub fn remove_cartridge(&mut self, cartridge_id: &str) -> bool;

    /// Get texture count
    pub fn len(&self) -> usize;

    /// Check if empty
    pub fn is_empty(&self) -> bool;
}
```

#### CartridgeTexture

```rust
pub struct CartridgeTexture {
    /// GPU texture
    pub texture: Texture,
    /// Texture view for rendering
    pub texture_view: TextureView,
    /// Bind group for rendering
    pub bind_group: BindGroup,
    /// Original image dimensions
    pub width: u32,
    pub height: u32,
    /// Cartridge ID
    pub cartridge_id: String,
}
```

### Testing
- Test fixtures in `tests/fixtures/test_cartridge.rts.png`
- Integration tests with real WGPU device
- Error handling for missing/invalid files
- Unit tests for manager methods

### Files Added/Modified
- `systems/infinite_map_rs/src/cartridge_texture_manager.rs`: New module
- `systems/infinite_map_rs/src/app.rs`: Integration with InfiniteMapApp
- `systems/infinite_map_rs/src/window.rs`: Cartridge texture fields
- `systems/infinite_map_rs/src/renderer.rs`: Rendering pipeline updates
- `systems/infinite_map_rs/tests/test_cartridge_texture_manager.rs`: Unit tests
- `systems/infinite_map_rs/tests/test_cartridge_rendering_textures.rs`: Rendering tests
- `systems/infinite_map_rs/tests/test_cartridge_texture_errors.rs`: Error handling tests
- `systems/infinite_map_rs/tests/test_cartridge_texture_integration.rs`: Integration tests
- `systems/infinite_map_rs/tests/fixtures/create_test_cartridge.py`: Fixture generator
- `systems/infinite_map_rs/tests/fixtures/test_cartridge.rts.png`: Test fixture

### Quick Reference
See [EVOLUTION_ZONE_TEXTURE_LOADING_QUICKREF.md](EVOLUTION_ZONE_TEXTURE_LOADING_QUICKREF.md) for usage examples and testing commands.

---

## Phase 35.9.3: Tile Interactions (Click to Boot) (2026-02-09)

### Overview
Cartridge tiles can now be clicked to boot them into RISC-V VM instances.

### Features
- Click detection for cartridge tiles
- Visual boot state feedback (color/border changes)
- CARTRIDGE_BOOT resonance emission
- Console window creation for VM output

### Boot States

| State | Border Color | Width | Description |
|-------|-------------|-------|-------------|
| Idle | Gold | 4px | Ready to boot |
| Booting | Cyan | 6px | Currently booting |
| Running | Green | 2px | VM running |
| Failed | Red | 8px | Boot failed |

### User Interaction Flow

1. User clicks on a cartridge tile (gold border)
2. Border turns cyan and thickens to indicate booting
3. Console window appears showing VM output
4. Border turns green when VM is running

### Implementation Details

#### Click Detection
The click handler in `InfiniteMapApp` detects cartridge tiles by checking:
1. Window is `WindowType::EvolutionZone`
2. Window has `has_cartridge_texture == true`
3. Window has `cartridge_texture_id` set

#### Boot Process
```
User Click -> boot_cartridge() -> Extract Binary -> Launch VM -> Visual Feedback
```

#### Daemon Integration
Booting emits a `CARTRIDGE_BOOT` resonance to notify the evolution daemon:
```json
{
  "action": "CARTRIDGE_BOOT",
  "cartridge_id": "...",
  "cartridge_path": "/path/to/file.rts.png",
  "binary_size": 1234
}
```

### API Reference

#### InfiniteMapApp::boot_cartridge
```rust
pub fn boot_cartridge(&mut self, cartridge_id: &str, window_id: usize) -> Result<(), String>
```
Boots a cartridge by launching it as a VM.

**Arguments:**
- `cartridge_id` - The ID of the cartridge to boot
- `window_id` - The window ID for visual feedback

**Returns:**
- `Ok(())` if boot initiated successfully
- `Err(String)` if boot failed

#### WindowManager::set_cartridge_boot_state
```rust
pub fn set_cartridge_boot_state(&mut self, window_id: usize, state: CartridgeBootState)
```
Sets the boot state of a cartridge window.

### Testing

Run integration tests:
```bash
cargo test --package infinite_map_rs cartridge_boot --lib
cargo test --package infinite_map_rs cartridge_click --lib
```

### Files Modified
- `systems/infinite_map_rs/src/app.rs`: Click handling updates, boot_cartridge method
- `systems/infinite_map_rs/src/window.rs`: CartridgeBootState enum, boot_state field
- `systems/infinite_map_rs/src/renderer.rs`: Boot state color rendering
- `systems/infinite_map_rs/tests/test_cartridge_boot.rs`: Boot functionality tests
- `systems/infinite_map_rs/tests/test_cartridge_click.rs`: Click detection tests

### Documentation
See [EVOLUTION_ZONE_TILE_INTERACTIONS.md](EVOLUTION_ZONE_TILE_INTERACTIONS.md) for complete user guide and API reference.
