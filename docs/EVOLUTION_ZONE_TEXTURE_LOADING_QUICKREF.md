# Evolution Zone Texture Loading - Quick Reference

## Overview
Phase 35.9.1 enables loading and rendering actual .rts.png cartridge textures in the Evolution Zone. This quick reference provides common usage patterns and testing commands.

## Table of Contents
- [Loading a Cartridge Texture](#loading-a-cartridge-texture)
- [Checking Loaded Status](#checking-loaded-status)
- [Getting Texture Dimensions](#getting-texture-dimensions)
- [Rendering Cartridges](#rendering-cartridges)
- [Testing Commands](#testing-commands)
- [Error Handling](#error-handling)
- [Common Patterns](#common-patterns)

---

## Loading a Cartridge Texture

### Basic Loading

```rust
use systems::infinite_map_rs::cartridge_texture_manager::CartridgeTextureManager;

// In your app context
let texture_loaded = if let Some(manager) = &self.cartridge_texture_manager {
    if let Ok(mut mgr) = manager.lock() {
        match mgr.load_cartridge(&cartridge_id, &path) {
            Ok(()) => {
                log::info!("Loaded cartridge texture: {}", cartridge_id);
                true
            }
            Err(e) => {
                log::warn!("Failed to load texture for {}: {}", cartridge_id, e);
                false
            }
        }
    } else {
        false
    }
} else {
    false
};
```

### With Error Handling

```rust
pub fn load_cartridge_safe(
    manager: &Arc<Mutex<CartridgeTextureManager>>,
    cartridge_id: &str,
    path: &Path,
) -> Result<(u32, u32), String> {
    let mut mgr = manager.lock()
        .map_err(|e| format!("Manager lock failed: {}", e))?;

    mgr.load_cartridge(cartridge_id, path)?;

    mgr.get_texture_info(cartridge_id)
        .ok_or_else(|| format!("Texture info not found for {}", cartridge_id))
}
```

---

## Checking Loaded Status

### Check if Texture is Loaded

```rust
if let Some(manager) = &self.cartridge_texture_manager {
    if let Ok(mgr) = manager.lock() {
        if mgr.has_texture(&cartridge_id) {
            // Texture is already loaded
            println!("Texture {} is ready", cartridge_id);
        } else {
            // Need to load it
            mgr.load_cartridge(&cartridge_id, &path)?;
        }
    }
}
```

### Check Manager Status

```rust
if let Some(manager) = &self.cartridge_texture_manager {
    if let Ok(mgr) = manager.lock() {
        println!("Loaded textures: {}", mgr.len());
        println!("Is empty: {}", mgr.is_empty());
    }
}
```

---

## Getting Texture Dimensions

### Get Dimensions for Window Sizing

```rust
let (width, height) = if let Some(manager) = &self.cartridge_texture_manager {
    if let Ok(mgr) = manager.lock() {
        mgr.get_texture_info(&cartridge_id)
            .unwrap_or((128, 128)) // Default fallback
    } else {
        (128, 128)
    }
} else {
    (128, 128)
};

// Create window with actual texture dimensions
let window_id = window_manager.create_window(
    title,
    x,
    y,
    width as f32,
    height as f32,
);
```

### Get Full Texture Object

```rust
if let Some(manager) = &self.cartridge_texture_manager {
    if let Ok(mgr) = manager.lock() {
        if let Some(texture) = mgr.get_texture(&cartridge_id) {
            println!("Texture: {}x{}", texture.width, texture.height);
            println!("Cartridge ID: {}", texture.cartridge_id);
            // Access texture.bind_group for rendering
        }
    }
}
```

---

## Rendering Cartridges

### Complete render_cartridges() Implementation

```rust
pub fn render_cartridges(&mut self) {
    let mut new_cartridges = Vec::new();

    // Collect new cartridges
    if let Some(em_arc) = &self.evolution_manager {
        if let Ok(em) = em_arc.lock() {
            let registry = em.get_cartridge_registry();
            for entry in registry.get_all_entries() {
                if !self.cartridges_rendered.contains(&entry.id) {
                    new_cartridges.push(entry.clone());
                }
            }
        }
    }

    // Process new cartridges
    for entry in new_cartridges {
        log::info!("Rendering cartridge: {} at ({}, {})",
            entry.id, entry.spawn_x, entry.spawn_y);

        // Load texture
        let texture_loaded = if let Some(manager) = &self.cartridge_texture_manager {
            if let Ok(mut mgr) = manager.lock() {
                mgr.load_cartridge(&entry.id, &entry.path).is_ok()
            } else {
                false
            }
        } else {
            false
        };

        // Get dimensions
        let (width, height) = if let Some(manager) = &self.cartridge_texture_manager {
            if let Ok(mgr) = manager.lock() {
                mgr.get_texture_info(&entry.id).unwrap_or((128, 128))
            } else {
                (128, 128)
            }
        } else {
            (128, 128)
        };

        // Create window
        let title = format!("Cartridge {} (Gen {})", entry.id, entry.generation);
        let window_id = self.window_manager.create_window(
            title,
            entry.spawn_x,
            entry.spawn_y,
            width as f32,
            height as f32,
        );

        // Set window type
        self.window_manager.set_window_type(
            window_id,
            WindowType::EvolutionZone
        );

        // Mark as cartridge texture
        if texture_loaded {
            self.window_manager.set_window_has_cartridge_texture(
                window_id,
                &entry.id
            );
        }

        // Track as rendered
        self.cartridges_rendered.insert(entry.id);
    }
}
```

---

## Testing Commands

### Create Test Fixture

```bash
# Generate a 64x64 test cartridge
python3 systems/infinite_map_rs/tests/fixtures/create_test_cartridge.py \
    systems/infinite_map_rs/tests/fixtures/test_cartridge.rts.png 64

# Generate a 256x256 test cartridge
python3 systems/infinite_map_rs/tests/fixtures/create_test_cartridge.py \
    large_cartridge.rts.png 256
```

### Run Tests

```bash
# Run all cartridge texture tests
cargo test --package infinite_map_rs test_cartridge

# Run specific test
cargo test --package infinite_map_rs test_cartridge_texture_manager_empty

# Run integration tests (requires WGPU device)
cargo test --package infinite_map_rs --ignored

# Run with output
cargo test --package infinite_map_rs -- --nocapture

# Run with logging
RUST_LOG=debug cargo test --package infinite_map_rs test_cartridge
```

### Build Verification

```bash
# Check compilation
cargo check --package infinite_map_rs

# Build release
cargo build --package infinite_map_rs --release

# Run clippy
cargo clippy --package infinite_map_rs -- -D warnings
```

---

## Error Handling

### Handle Missing Files

```rust
match mgr.load_cartridge(&cartridge_id, &path) {
    Ok(()) => {
        log::info!("Loaded texture for {}", cartridge_id);
    }
    Err(e) if e.contains("not found") => {
        log::warn!("Cartridge file missing: {}", path.display());
        // Use placeholder
    }
    Err(e) if e.contains("Failed to load") => {
        log::error!("Invalid cartridge format: {}", e);
        // Show error to user
    }
    Err(e) => {
        log::error!("Unexpected error: {}", e);
    }
}
```

### Handle Invalid PNGs

```rust
// The RTSTexture loader will return an error for invalid PNGs
// Check for specific error messages
if let Err(e) = mgr.load_cartridge(&id, &path) {
    if e.contains("PNG") {
        log::error!("Invalid PNG format for cartridge {}", id);
    } else if e.contains("dimensions") {
        log::error!("Invalid dimensions for cartridge {}", id);
    }
}
```

### Graceful Degradation

```rust
// Always have a fallback
let dimensions = mgr.get_texture_info(&cartridge_id)
    .or_else(|| mgr.get_texture_info("default"))
    .unwrap_or((128, 128));
```

---

## Common Patterns

### Pattern 1: Lazy Loading

```rust
pub fn ensure_cartridge_loaded(&mut self, cartridge_id: &str, path: &Path) -> bool {
    if let Some(manager) = &self.cartridge_texture_manager {
        if let Ok(mut mgr) = manager.lock() {
            if !mgr.has_texture(cartridge_id) {
                return mgr.load_cartridge(cartridge_id, path).is_ok();
            }
            return true;
        }
    }
    false
}
```

### Pattern 2: Batch Loading

```rust
pub fn load_cartridges_batch(
    &mut self,
    cartridges: Vec<(String, PathBuf)>
) -> Result<(), String> {
    if let Some(manager) = &self.cartridge_texture_manager {
        let mut mgr = manager.lock()
            .map_err(|e| format!("Lock failed: {}", e))?;

        for (id, path) in cartridges {
            mgr.load_cartridge(&id, &path)?;
        }

        Ok(())
    } else {
        Err("Manager not initialized".to_string())
    }
}
```

### Pattern 3: Texture Cleanup

```rust
pub fn cleanup_old_cartridges(&mut self, active_ids: &HashSet<String>) {
    if let Some(manager) = &self.cartridge_texture_manager {
        if let Ok(mut mgr) = manager.lock() {
            let all_loaded: Vec<_> = mgr.textures.keys()
                .filter(|id| !active_ids.contains(*id))
                .cloned()
                .collect();

            for id in all_loaded {
                log::info!("Removing old cartridge: {}", id);
                mgr.remove_cartridge(&id);
            }
        }
    }
}
```

### Pattern 4: Texture Preloading

```rust
pub fn preload_cartridges(&mut self, paths: Vec<PathBuf>) {
    if let Some(manager) = &self.cartridge_texture_manager {
        if let Ok(mut mgr) = manager.lock() {
            for (i, path) in paths.iter().enumerate() {
                let id = format!("preload_{}", i);
                if let Err(e) = mgr.load_cartridge(&id, path) {
                    log::warn!("Failed to preload {}: {}", id, e);
                }
            }
        }
    }
}
```

---

## API Reference

### CartridgeTextureManager

```rust
pub struct CartridgeTextureManager {
    device: Arc<Device>,
    queue: Arc<Queue>,
    bind_group_layout: Arc<BindGroupLayout>,
    sampler: Arc<Sampler>,
    textures: HashMap<String, CartridgeTexture>,
}

impl CartridgeTextureManager {
    pub fn new(
        device: Arc<Device>,
        queue: Arc<Queue>,
        bind_group_layout: Arc<BindGroupLayout>,
        sampler: Arc<Sampler>,
    ) -> Self;

    pub fn load_cartridge<P: AsRef<Path>>(
        &mut self,
        cartridge_id: &str,
        path: P,
    ) -> Result<(), String>;

    pub fn get_texture(&self, cartridge_id: &str)
        -> Option<&CartridgeTexture>;

    pub fn has_texture(&self, cartridge_id: &str) -> bool;

    pub fn get_texture_info(&self, cartridge_id: &str)
        -> Option<(u32, u32)>;

    pub fn remove_cartridge(&mut self, cartridge_id: &str) -> bool;

    pub fn len(&self) -> usize;
    pub fn is_empty(&self) -> bool;
}
```

### CartridgeTexture

```rust
pub struct CartridgeTexture {
    pub texture: Texture,
    pub texture_view: TextureView,
    pub bind_group: BindGroup,
    pub width: u32,
    pub height: u32,
    pub cartridge_id: String,
}
```

---

## See Also
- [EVOLUTION_ZONE_INTEGRATION.md](EVOLUTION_ZONE_INTEGRATION.md) - Full integration documentation
- [docs/plans/2026-02-09-evolution-zone-texture-loading.md](plans/2026-02-09-evolution-zone-texture-loading.md) - Implementation plan
- [systems/infinite_map_rs/src/cartridge_texture_manager.rs](../systems/infinite_map_rs/src/cartridge_texture_manager.rs) - Source code
