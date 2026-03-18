# ASCII to GPU Pipeline

> How ASCII templates become sovereign pixel programs that run on the Glyph VM.

## The Vision

```
ASCII Art → Compiler → .rts.png → Synthetic VRAM → Glyph VM → Screen
```

No Python at runtime. No JavaScript at runtime. No HTTP APIs.

The ASCII template IS the program. The pixels ARE the computation.

---

## Current State

### What Exists

| Component | Path | Status |
|-----------|------|--------|
| ASCII Compiler | `apps/ascii-world/ascii-world-master/apps/geos-ascii/compiler/` | ✅ Works |
| Dashboard Template | `apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/dashboard.ascii` | ✅ Ready |
| Action Mappings | `apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/dashboard.mapping.json` | ✅ Ready |
| Compiled Cartridge | `apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/dashboard.rts.png` | ✅ Generated |
| Rust Cartridge Loader | `systems/infinite_map_rs/src/ascii_cartridge.rs` | ✅ Implemented |
| Opcode Alignment | `ascii_cartridge.rs::sit_to_glyph_opcode()` | ✅ Aligned |
| Click Handler | `synthetic_vram.rs::handle_sit_click()` | ✅ Implemented |
| Synthetic VRAM | `systems/infinite_map_rs/src/synthetic_vram.rs` | ✅ CPU emulator |
| Glyph VM Opcodes | `systems/infinite_map_rs/src/glyph_assembler.rs` | ✅ Defined |

### Tests

```bash
# Run all ASCII cartridge tests
cargo test ascii_cartridge --lib

# Run click handler test
cargo test test_sit_click_handler --lib
```

---

## Architecture

### The Cartridge Format (.rts.png)

A single PNG with 4 segments stacked vertically:

```
┌─────────────────────────────────────────┐
│ Segment 1: Glyph Grid (80×24 RGBA)      │  ← ASCII characters as pixels
│                                         │     Each pixel R = ASCII code
├─────────────────────────────────────────┤
│ Segment 2: SIT (256×1 RGBA)             │  ← Spatial Instruction Table
│                                         │     Maps screen coords to actions
├─────────────────────────────────────────┤
│ Segment 3: State Buffer (1024×1 RGBA)   │  ← Mutable state variables
│                                         │     {{variable}} substitutions
├─────────────────────────────────────────┤
│ Segment 4: Bootstrap (16×16 RGBA)       │  ← Metadata header
│                                         │     name, version, pattern count
└─────────────────────────────────────────┘
```

### Segment Details

#### Segment 1: Glyph Grid (80×24)

Each pixel encodes one ASCII character:

```
Pixel at (x, y):
  R channel = ASCII code (0-127)
  G channel = ASCII code (copy, for visibility)
  B channel = ASCII code (copy, for visibility)
  A channel = 255 (opaque)
```

Example: Character `A` at position (5, 2):
```
grid[2, 5] = [65, 65, 65, 255]  // 'A' = ASCII 65
```

#### Segment 2: Spatial Instruction Table (SIT)

Maps screen coordinates to actions. Each pixel at index `y * 80 + x`:

```
Pixel at index N:
  R channel = Opcode (what to do)
  G channel = Target byte 0 (low)
  B channel = Target byte 1 (mid)
  A channel = 255 (opaque)
```

Target encodes a label like "main" as 3 bytes.

#### Segment 3: State Buffer

Mutable storage for `{{variable}}` substitutions:

```
Row 0: "READY" encoded as pixels
Row 1: "42" encoded as pixels
...
```

The Glyph VM can read/write this at runtime.

#### Segment 4: Bootstrap Header

Metadata for loading:

```
Row 0: Cartridge name (16 bytes, UTF-8)
Row 1: Version (major, minor, patch, 0)
Row 2: Pattern count (low byte, high byte, 0, 0)
Row 3: Magic "GEOSASCII" (16 bytes)
```

---

## The Opcode Problem

### Current Mismatch

**Python Compiler (geos_ascii_compiler.py):**
```python
OPCODES = {
    "NOP": 0,
    "JUMP": 1,     # ← Wrong!
    "CALL": 2,     # ← Wrong!
    "TOGGLE": 3,
    "INPUT": 4,
    "OUTPUT": 5,
    "EXIT": 255,   # ← Wrong!
}
```

**Rust Glyph VM (glyph_assembler.rs):**
```rust
pub enum Opcode {
    Nop = 0,
    Ldi = 1,
    Mov = 2,
    Load = 3,
    Store = 4,
    Add = 5,
    Sub = 6,
    Mul = 7,
    Div = 8,
    Jmp = 9,       # ← Real value
    Branch = 10,
    Call = 11,     # ← Real value
    Ret = 12,
    Halt = 13,     # ← Real value
    // ...
}
```

### The Fix

Update the Python compiler to use Glyph VM opcodes:

```python
OPCODES = {
    "NOP": 0,
    "JMP": 9,      # Aligned with Glyph VM
    "CALL": 11,    # Aligned with Glyph VM
    "HALT": 13,    # Aligned with Glyph VM
}
```

---

## The Execution Model

### How Clicks Should Work

```
1. User clicks at screen position (x, y)
2. Convert to SIT index: idx = y * 80 + x
3. Read SIT[idx] → (opcode, target)
4. Execute Glyph VM opcode:
   - JMP target → jump PC to target address
   - CALL target → push PC, jump to target
   - HALT → stop VM
5. VM continues execution from new PC
6. Render updated state to screen
```

### Current (Broken) Flow

```
ASCII → Python Compiler → PNG → JavaScript Viewer → console.log()
                                                   ↓
                                              "JUMP → main"
                                              (nothing happens)
```

### Target (Correct) Flow

```
ASCII → Python Compiler → PNG → Rust Loader → Synthetic VRAM
                                                          ↓
                                          Click → VM Opcode Execution
                                                          ↓
                                          Glyph VM → Render
```

---

## Implementation Plan

### Phase 1: Align Opcodes

**File:** `apps/ascii-world/ascii-world-master/apps/geos-ascii/compiler/geos_ascii_compiler.py`

```python
# Before
OPCODES = {
    "NOP": 0,
    "JUMP": 1,
    "CALL": 2,
    "EXIT": 255,
}

# After
OPCODES = {
    "NOP": 0,
    "JMP": 9,      # Glyph VM opcode
    "CALL": 11,    # Glyph VM opcode
    "HALT": 13,    # Glyph VM opcode
}
```

### Phase 2: Create Rust Loader

**File:** `systems/infinite_map_rs/src/ascii_cartridge.rs`

```rust
pub struct AsciiCartridge {
    pub glyph_grid: Vec<u8>,      // 80 * 24 bytes
    pub sit: Vec<u32>,            // 256 entries
    pub state_buffer: Vec<u32>,   // 1024 entries
    pub bootstrap: BootstrapHeader,
}

pub struct BootstrapHeader {
    pub name: String,
    pub version: (u8, u8, u8),
    pub pattern_count: u16,
}

impl AsciiCartridge {
    pub fn load_png(path: &Path) -> Result<Self, Error> {
        // 1. Decode PNG
        // 2. Extract 4 segments
        // 3. Parse bootstrap header
        // 4. Return structured cartridge
    }

    pub fn to_vram(&self, vram: &mut SyntheticVram, base_addr: u32) {
        // 1. Write glyph grid to Hilbert addresses
        // 2. Write SIT after glyph grid
        // 3. Write state buffer after SIT
        // 4. Return entry point address
    }
}
```

### Phase 3: Wire Click Execution

**File:** `systems/infinite_map_rs/src/synthetic_vram.rs`

Add method:

```rust
impl SyntheticVram {
    /// Handle a click at screen position (x, y)
    /// Reads SIT, executes opcode, returns true if state changed
    pub fn handle_click(&mut self, x: u32, y: u32) -> bool {
        let sit_base = 80 * 24;  // After glyph grid
        let idx = sit_base + (y * 80 + x);

        let pixel = self.peek(idx);
        let opcode = (pixel & 0xFF) as u8;
        let target = (pixel >> 8) & 0xFFFFFF;

        match opcode {
            9 => { // JMP
                self.vms[0].pc = target;
                true
            }
            11 => { // CALL
                let vm = &mut self.vms[0];
                vm.stack[vm.stack_ptr as usize] = vm.pc;
                vm.stack_ptr += 1;
                vm.pc = target;
                true
            }
            13 => { // HALT
                self.vms[0].halted = 1;
                true
            }
            _ => false
        }
    }
}
```

### Phase 4: Integration Test

**File:** `systems/infinite_map_rs/tests/ascii_cartridge_test.rs`

```rust
#[test]
fn test_dashboard_loads_and_responds() {
    let mut vram = SyntheticVram::new_small(256);

    // Load the compiled dashboard
    let cartridge = AsciiCartridge::load_png(
        Path::new("apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/dashboard.rts.png")
    ).unwrap();

    cartridge.to_vram(&mut vram, 0);

    // Click [A] Run button (position 4, 4 in dashboard.ascii)
    let state_changed = vram.handle_click(4, 4);
    assert!(state_changed);

    // Verify VM jumped to "main" target
    assert_eq!(vram.vm_state(0).unwrap().pc, /* address of "main" */);
}
```

---

## Why This Matters

### Before: Code Controls Pixels

```typescript
// JavaScript viewer
handleClick(x, y) {
    const action = sit[y * 80 + x];
    console.log(`${action.opcode} → ${action.target}`);  // Just logs!
}
```

The code runs the show. The pixels are just data.

### After: Pixels Move Pixels

```rust
// Rust VM
fn handle_click(&mut self, x: u32, y: u32) {
    let pixel = self.peek(sit_base + y * 80 + x);
    let opcode = pixel & 0xFF;

    // Execute the opcode IN THE VM
    match opcode {
        9 => self.vms[0].pc = pixel >> 8,  // JMP
        11 => { /* CALL */ },
        13 => self.vms[0].halted = 1,      // HALT
        _ => {}
    }
}
```

The VM reads pixels and executes. No interpreter code. The pixels ARE the program.

---

## The Sovereignty Chain

```
Text (ASCII)
    ↓ compile
PNG (pixels)
    ↓ load
Synthetic VRAM (Hilbert-addressed u32 array)
    ↓ execute
Glyph VM (reads pixels, computes, writes pixels)
    ↓ render
Screen (visual output)
```

Each step is a format transformation, not an interpretation layer.

---

## Next Steps

1. **Fix the compiler** - Update `OPCODES` in `geos_ascii_compiler.py`
2. **Create `ascii_cartridge.rs`** - Rust loader
3. **Add `handle_click` to SyntheticVram** - VM execution on click
4. **Write integration test** - Verify the full chain
5. **Delete the HTML viewer** - No more JavaScript

---

## File Reference

```
geometry_os/
├── apps/ascii-world/ascii-world-master/apps/geos-ascii/
│   ├── compiler/
│   │   └── geos_ascii_compiler.py     # Python compiler (needs opcode fix)
│   ├── examples/
│   │   ├── dashboard.ascii            # ASCII template
│   │   ├── dashboard.mapping.json     # Action mappings
│   │   └── dashboard.rts.png          # Compiled cartridge
│   └── viewer/
│       └── geos-viewer.html           # DELETE THIS (JS-based)
│
├── systems/infinite_map_rs/src/
│   ├── synthetic_vram.rs              # CPU VM emulator (add handle_click)
│   ├── glyph_assembler.rs             # Opcode definitions (source of truth)
│   └── ascii_cartridge.rs             # CREATE THIS (Rust loader)
│
└── docs/
    └── ASCII_TO_GPU_PIPELINE.md       # This document
```

---

*Last updated: 2026-03-18*
*Authors: Geometry OS Team*
