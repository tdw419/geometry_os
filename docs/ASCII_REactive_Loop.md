# ASCII Reactive Loop

> How the reactive loop enables self-contained, pixel-programmed interactive UIs.

## Overview

The ASCII-to-GPU pipeline now supports **reactive cartridges** - ASCII templates that compile to `.rts.png` files and execute VM opcodes directly.

This document explains how the reactive loop works:

## The Reactive Loops

### Type 1: Click → VM Execution

```
User clicks [A] button
    ↓
SIT lookup finds action at (x, y)
    ↓
handle_sit_click(opcode, target)
    ↓
VM PC jumps to target address
    ↓
VM executes from new PC
```

### Type 2: VM → Display Update

```
VM executes LOAD/Store
    ↓
Write to glyph grid (0x0000-0x0BFF)
    ↓
Display renders new pixel
```

### Type 3: State Management

```
VM reads state from 0xF000
    ↓
VM modifies state
    ↓
VM writes back to 0xF000
    ↓
State persists across frames
```

## Memory Layout

| Region | Address Range | Size | Purpose |
|--------|---------------|------|---------|
| Glyph Grid | `0x0000-0x1BFF` | 1920 (80×24) | Visible ASCII display |
| SIT | `0x0C00-0x0DFF` | 1920 | Spatial Instruction Table |
| State Buffer | `0xF000-0x0F3FF` | 1024 | Application variables |
| Program | `0x8000+` | Varies | VM instructions |

## File Structure

```
systems/infinite_map_rs/
├── src/
│   ├── ascii_cartridge.rs     # Cartridge loader
│   │   └── mem_layout constants
│   └── synthetic_vram.rs       # VM emulator + handle_sit_click()
│
├── tests/
│   └── ascii_cartridge_integration.rs  # Integration tests
│
└── apps/ascii-world/.../geos-ascii/
    ├── examples/
    │   ├── reactive_test.ascii       # Test cartridge template
    │   ├── reactive_test.mapping.json
    │   └── reactive_test.rts.png       # Compiled cartridge
```

## Running Tests

```bash
cd systems/infinite_map_rs
cargo test ascii_cartridge_integration -- --nocapture
```

Expected output:
```
test test_sit_opcode_conversion ... ok
test test_memory_layout_constants ... ok
test test_vm_writes_to_state_buffer ... ok
test test_vm_writes_to_glyph_grid ... ok
test test_cartridge_state_buffer_dimensions ... ok
test test_cartridge_glyph_grid_dimensions ... ok
test test_cartridge_loads ... ok
test test_click_to_vm_execution ... ok
test test_full_reactive_loop ... ok
```

## Usage Example

```rust
use infinite_map_rs::ascii_cartridge::{AsciiCartridge, mem_layout};
use infinite_map_rs::synthetic_vram::{SyntheticVram, SyntheticVmConfig};

fn main() {
    // Load cartridge
    let cartridge = AsciiCartridge::load("examples/reactive_test.rts.png").unwrap();

    // Create VRAM
    let mut vram = SyntheticVram::new_small(256);
    vram.spawn_vm(0, &SyntheticVmConfig::default()).unwrap();

    // Load into VRAM
    cartridge.load_into_vram(&mut vram, 0).unwrap();

    // Simulate click at if let Some(action) = cartridge.find_action_at(4, 4) {
        vram.handle_sit_click(0, action.opcode, action.target_addr);

        // Execute VM
        for _ in 0..100 {
            if vram.is_halted(0) { break; }
            vram.step(0);
        }
    }

    println!("Click executed VM: PC = {}", vram.vm_state(0).unwrap().pc);
}
```

## Next Steps

1. Add more complex VM programs to test cartridges
2. Port to real GPU (WebGPU shaders)
3. Build full applications using this system
