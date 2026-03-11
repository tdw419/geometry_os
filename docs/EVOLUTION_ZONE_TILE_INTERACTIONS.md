# Evolution Zone Tile Interactions (Phase 35.9.3)

## Overview

Cartridge tiles in the Evolution Zone can be clicked to boot them into runnable RISC-V VM instances.

## User Interaction

1. **Click on a cartridge tile** - Left-click on any cartridge tile (gold border)
2. **Visual feedback** - Border turns cyan and thickens to indicate booting
3. **VM launch** - A console window appears showing VM output
4. **Running state** - Border turns green when VM is running

## Boot States

| State | Border Color | Width | Description |
|-------|-------------|-------|-------------|
| Idle | Gold | 4px | Ready to boot |
| Booting | Cyan | 6px | Currently booting |
| Running | Green | 2px | VM running |
| Failed | Red | 8px | Boot failed |

## Implementation

### Click Detection

Click handling in `InfiniteMapApp` detects:
1. Window is `WindowType::EvolutionZone`
2. Window has `has_cartridge_texture == true`
3. Window has `cartridge_texture_id` set

### Boot Process

```
User Click -> boot_cartridge() -> Extract Binary -> Launch VM -> Visual Feedback
```

### Daemon Integration

Booting emits a `CARTRIDGE_BOOT` resonance to notify the evolution daemon:
```json
{
  "action": "CARTRIDGE_BOOT",
  "cartridge_id": "...",
  "cartridge_path": "/path/to/file.rts.png",
  "binary_size": 1234
}
```

## Future Work

- **Phase 35.9.4**: Real PNG binary extraction using `pixelrts_v2_extractor`
- **Phase 35.9.5**: Actual VM launch with `MultiVmManager`
- **Phase 35.9.6**: VM console output integration
- **Phase 35.9.7**: VM lifecycle management (pause, resume, terminate)

## API Reference

### InfiniteMapApp::boot_cartridge

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

### WindowManager::set_cartridge_boot_state

```rust
pub fn set_cartridge_boot_state(&mut self, window_id: usize, state: CartridgeBootState)
```

Sets the boot state of a cartridge window.

## Testing

Run integration tests:
```bash
cargo test --package infinite_map_rs cartridge_boot --lib
cargo test --package infinite_map_rs cartridge_click --lib
```

## Example Usage

See the click handler in `app.rs` around line 5785 for a complete example.
