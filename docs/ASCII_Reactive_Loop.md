# ASCII Reactive Loop

> The first self-contained, pixel-programmed interactive UI in Geometry OS.

## What It Is

The ASCII Reactive Loop connects an ASCII art template to a GPU-sovereign VM execution pipeline. You draw a UI in plain text, define clickable regions with a mapping file, compile it all into a `.rts.png` cartridge, and load it into Synthetic VRAM where click events trigger VM opcode execution — no JavaScript, no CPU interpretation, no runtime parsing.

```
ASCII Template ──→ Compiler ──→ .rts.png Cartridge
                                       │
                        Rust Loader ◄──┘
                              │
                     Synthetic VRAM / GPU
                              │
                   Click ──→ SIT Lookup ──→ VM Opcode ──→ Display
```

This is the **Sovereignty Chain**: text becomes pixels, pixels become instructions, instructions move pixels.

---

## The Three Files

Every reactive cartridge starts as three files:

### 1. ASCII Template (`.ascii`)

A plain-text UI layout. Buttons are marked with `[X]` notation:

```
┌────────────────────────────────────────────────────────────┐
│  REACTIVE TEST v1.0                                        │
├────────────────────────────────────────────────────────────┤
│                                                            │
│   [A] Increment    [B] Decrement    [C] Reset             │
│                                                            │
├────────────────────────────────────────────────────────────┤
│                                                            │
│   Counter: X                                               │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

**File:** `apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/reactive_test.ascii`

### 2. Mapping File (`.mapping.json`)

Defines what each button does — which SIT opcode to emit and what VM target to jump to:

```json
{
  "buttons": [
    {"label": "A", "action": "JUMP", "target": "increment"},
    {"label": "B", "action": "JUMP", "target": "decrement"},
    {"label": "C", "action": "JUMP", "target": "reset"}
  ],
  "labels": {
    "increment": "VM code that increments counter",
    "decrement": "VM code that decrements counter",
    "reset": "VM code that resets counter to 0"
  }
}
```

**File:** `apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/reactive_test.mapping.json`

### 3. Compiled Cartridge (`.rts.png`)

The compiler packs everything into a single PNG image with four vertical segments:

```
┌──────────────────────────────┐  ─┐
│  Segment 1: Glyph Grid      │   │ 80×24 pixels
│  (ASCII chars as RGBA)       │   │ Each pixel = one character
├──────────────────────────────┤  ─┤
│  Segment 2: SIT              │   │ 256×80 pixels
│  (Spatial Instruction Table) │   │ Click → opcode mapping
├──────────────────────────────┤  ─┤
│  Segment 3: State Buffer     │   │ 1024×80 pixels
│  (Mutable application state) │   │ Persists across frames
├──────────────────────────────┤  ─┤
│  Segment 4: Bootstrap Header │   │ 16×80 pixels
│  (Name, version, magic)      │   │ Cartridge metadata
└──────────────────────────────┘  ─┘
```

**File:** `apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/reactive_test.rts.png`

---

## How the Reactive Loop Works

### Step 1: Load Cartridge into VRAM

The Rust loader (`AsciiCartridge::load()`) parses the `.rts.png`, extracts all four segments, and writes glyph and state data into Synthetic VRAM via `poke()`:

```rust
let cartridge = AsciiCartridge::load("reactive_test.rts.png").unwrap();
cartridge.load_into_vram(&mut vram, 0).unwrap();
```

The glyph grid occupies Hilbert addresses `0x0000–0x077F` (80×24 = 1920 cells). The state buffer starts at `0xF000`.

### Step 2: User Clicks a Button

When a click lands on a `[A]` button, the system looks up the SIT (Spatial Instruction Table) for that (x, y) coordinate:

```rust
if let Some(action) = cartridge.find_action_at(x, y) {
    vram.handle_sit_click(0, action.opcode, action.target_addr);
}
```

### Step 3: SIT → VM Opcode

The SIT entry contains a legacy opcode (from the compiler) which gets translated to a real Glyph VM opcode:

| SIT Opcode | Value | Glyph VM Opcode | Value |
|------------|-------|------------------|-------|
| `NOP`      | 0     | `NOP`            | 0     |
| `JUMP`     | 1     | `JMP`            | 209   |
| `CALL`     | 2     | `CALL`           | 11    |
| `EXIT`     | 255   | `HALT`           | 13    |

`handle_sit_click()` sets the VM's program counter to the target address and resumes execution.

### Step 4: VM Executes

The VM runs from its new PC, executing Glyph VM instructions. It can:

- **Read/write the glyph grid** (`0x0000–0x077F`) to change displayed characters
- **Read/write the state buffer** (`0xF000–0xF3FF`) to maintain application state
- **HALT** when done, waiting for the next click

### Step 5: Display Updates

Any writes to the glyph grid region are immediately visible. The pixel IS the display — there's no separate render pass. The VM wrote directly to the substrate.

---

## Memory Layout

These constants live in `ascii_cartridge::mem_layout`:

| Region        | Address       | Size  | Purpose                        |
|---------------|---------------|-------|--------------------------------|
| Glyph Grid    | `0x0000`      | 1920  | Visible 80×24 ASCII display    |
| Reserved      | `0x0C00`      | 29696 | Future expansion               |
| Program Code  | `0x8000`      | 28672 | VM instructions                |
| State Buffer  | `0xF000`      | 1024  | Mutable application variables  |

Helper functions:

```rust
mem_layout::glyph_addr(10, 5)  // → 410  (y*80 + x = 5*80 + 10)
mem_layout::state_addr(5)      // → 0xF005
```

---

## Instruction Encoding in the SIT

Each SIT entry is stored as an RGBA pixel:

```
R = opcode (legacy SIT opcode, converted at load time)
G = parameter 1
B = parameter 2 (low byte of target)
A = parameter 2 (high byte of target)
```

The target address is packed as a 16-bit little-endian value across the G and B channels. Non-zero R values indicate active entries.

---

## Testing

Nine integration tests verify the full pipeline:

```bash
cd systems/infinite_map_rs
cargo test ascii_cartridge_integration -- --nocapture
```

| Test | What It Verifies |
|------|------------------|
| `test_cartridge_loads` | PNG parses, dimensions valid, bootstrap populated |
| `test_memory_layout_constants` | `GLYPH_BASE=0x0000`, `STATE_BASE=0xF000`, `PROGRAM_BASE=0x8000` |
| `test_sit_opcode_conversion` | Legacy SIT opcodes map to correct Glyph VM opcodes |
| `test_click_to_vm_execution` | Click on SIT action triggers `handle_sit_click()` |
| `test_vm_writes_to_glyph_grid` | `poke()` to glyph region is readable via `peek()` |
| `test_vm_writes_to_state_buffer` | `poke()` to `0xF000` persists correctly |
| `test_full_reactive_loop` | Load → click all actions → verify VRAM mutation |
| `test_cartridge_glyph_grid_dimensions` | Glyph grid is exactly 80×24×4 bytes |
| `test_cartridge_state_buffer_dimensions` | State buffer is exactly 1024×80×4 bytes |

---

## Complete Usage Example

```rust
use infinite_map_rs::ascii_cartridge::{AsciiCartridge, mem_layout};
use infinite_map_rs::synthetic_vram::{SyntheticVram, SyntheticVmConfig};

fn main() {
    // 1. Load cartridge from compiled PNG
    let cartridge = AsciiCartridge::load("reactive_test.rts.png").unwrap();

    // 2. Create Synthetic VRAM and spawn a VM
    let mut vram = SyntheticVram::new_small(256);
    vram.spawn_vm(0, &SyntheticVmConfig::default()).unwrap();

    // 3. Load cartridge data into VRAM
    cartridge.load_into_vram(&mut vram, 0).unwrap();

    // 4. Simulate a click — find action at screen coordinates
    if let Some(action) = cartridge.find_action_at(4, 4) {
        // Translate click to VM execution
        vram.handle_sit_click(0, action.opcode, action.target_addr);

        // 5. Run VM until it halts
        for _ in 0..100 {
            if vram.is_halted(0) { break; }
            vram.step(0);
        }

        println!("VM executed, PC = {}", vram.vm_state(0).unwrap().pc);
    }

    // 6. Read back display — check if glyph grid changed
    let glyph_at_origin = vram.peek(mem_layout::GLYPH_BASE);
    println!("Glyph at (0,0) = 0x{:08X}", glyph_at_origin);

    // 7. Read application state
    let counter = vram.peek(mem_layout::STATE_BASE);
    println!("Counter state = {}", counter);
}
```

---

## Key Source Files

| File | Purpose |
|------|---------|
| `systems/infinite_map_rs/src/ascii_cartridge.rs` | Cartridge loader, memory layout constants, SIT parser |
| `systems/infinite_map_rs/src/synthetic_vram.rs` | VM emulator, `handle_sit_click()`, `poke()`/`peek()` |
| `systems/infinite_map_rs/tests/ascii_cartridge_integration.rs` | 9 integration tests |
| `apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/reactive_test.ascii` | Test template |
| `apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/reactive_test.mapping.json` | Button→action mapping |
| `apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/reactive_test.rts.png` | Compiled cartridge |

---

## Why This Matters

This is the first time a Geometry OS program responds to user input through the pixel substrate. The reactive loop proves:

1. **ASCII templates can define interactive UIs** — no custom widget toolkit needed
2. **The SIT bridges human intent to VM execution** — a click becomes an opcode
3. **State persists in the substrate** — the state buffer survives across interaction cycles
4. **The sovereignty chain is unbroken** — text → pixels → instructions → display, all within the GPU-sovereign model

The CPU's only role is the frozen bootstrap: loading the cartridge into VRAM. After that, the VM handles everything — reading clicks, executing logic, updating the display. Programs write programs. Pixels move pixels.
