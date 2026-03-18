# Frozen Bootloader Design: Geos-Boot

> **Status:** Design Approved
> **Date:** 2026-03-18
> **Pattern Source:** gvpie_bootstrap

## Problem Statement

The Geometry OS project aims to "program with pixels" rather than using traditional languages (Rust, Python, JavaScript). However:

1. Rust compilation causes system crashes (rustc at 100% CPU)
2. Continuous Rust modifications contradict the sovereignty goal
3. Need a path to frozen CPU code with evolving GPU code

## Solution: Frozen Bootstrap Pattern

The **Frozen Bootstrap Pattern** extracts from gvpie_bootstrap establishes a permanent CPU shell that:
- Initializes WebGPU once
- Forwards events to GPU
- Never requires recompilation after freeze

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    FROZEN RUST SHELL                        │
│  (geos-boot - written once, never modified)                 │
├─────────────────────────────────────────────────────────────┤
│  • WebGPU surface initialization                            │
│  • Adapter selection (discrete GPU preferred)               │
│  • Event capture (keyboard/mouse/scroll)                    │
│  • Mailbox writes to GPU buffer at 0x200                    │
│  • Disk I/O for .glyph file loading                         │
└───────────────────┬─────────────────────────────────────────┘
                    │ I/O Contract (1 MiB shared buffer)
                    ▼
┌─────────────────────────────────────────────────────────────┐
│                    GPU GLYPH VM                             │
│  (glyph_vm.wgsl - evolves via pixels)                      │
├─────────────────────────────────────────────────────────────┤
│  • Opcode execution (LDI, ADD, JMP, DRAW, etc.)            │
│  • Self-modifying code support                              │
│  • Pixel rendering to texture                               │
│  • SPATIAL_SPAWN for multi-VM                               │
└───────────────────┬─────────────────────────────────────────┘
                    │ Render texture
                    ▼
┌─────────────────────────────────────────────────────────────┐
│                    VISUAL OUTPUT                            │
│  (shell.glyph - UI written in Glyph Assembly)              │
└─────────────────────────────────────────────────────────────┘
```

## I/O Contract

The CPU and GPU communicate through a fixed memory layout:

| Address | Size | Purpose |
|---------|------|---------|
| 0x0000 | 512 | VM State (PC, registers, flags) |
| 0x0200 | 256 | Mailbox (CPU→GPU events) |
| 0x0300 | 1024 | Event buffer |
| 0x1000+ | ~1MB | Glyph program memory |

### Event Format (from gvpie_bootstrap)

```rust
// Event layout (u32 words):
// [0] = event_type (1=mouse_move, 2=mouse_button, 3=keyboard, 4=scroll)
// [1] = param_1 (x/scanCode/button)
// [2] = param_2 (y/keyCode/state)
// [3] = param_3 (mods/clicks/deltaY)

const EVENT_MOUSE_MOVE: u32 = 1;
const EVENT_MOUSE_BUTTON: u32 = 2;
const EVENT_KEYBOARD: u32 = 3;
const EVENT_SCROLL: u32 = 4;
```

## Implementation Structure

```
systems/geos-boot/
├── Cargo.toml
├── FREEZE_MANIFEST.md      # Declaration of frozen state
├── src/
│   ├── main.rs             # WebGPU init, main loop
│   ├── io_contract.rs      # Buffer layout constants
│   ├── event_forwarder.rs  # winit events → mailbox
│   └── glyph_loader.rs     # .glyph file → GPU buffer
```

## File Responsibilities

### main.rs
- WebGPU surface creation
- GPU adapter selection (discrete preferred)
- Compute/render pipeline setup
- Main event loop

### io_contract.rs
- Buffer size constants
- Memory layout definitions
- Mailbox address constants

### event_forwarder.rs
- winit event → mailbox format conversion
- Event buffer management
- GPU buffer writes

### glyph_loader.rs
- .glyph file parsing
- GPU buffer initialization
- Boot program loading

## Freeze Manifest

After initial development, a `FREEZE_MANIFEST.md` will be committed declaring:

```markdown
# Freeze Manifest

Date: [DATE]
Commit: [SHA]

## CPU Responsibilities (FROZEN)
- Windowing via winit
- WebGPU initialization
- Event forwarding to mailbox
- .glyph file loading

## GPU Responsibilities (EVOLVING)
- All program logic
- All visual rendering
- All state management

## Vow
No further modifications to src/*.rs without explicit unfreeze ceremony.
```

## Migration Path

1. Create `systems/geos-boot/` from gvpie_bootstrap patterns
2. Replace "Card" structures with Glyph VM structures
3. Wire mailbox to existing Glyph VM mailbox segment (0x200)
4. Test with existing .glyph programs
5. Freeze with manifest

## Success Criteria

- [ ] WebGPU surface initializes
- [ ] Events forwarded to GPU mailbox
- [ ] .glyph files load and execute
- [ ] Visual output renders
- [ ] Freeze manifest committed
- [ ] No Rust compilation required for 30 days

## References

- `gvpie_bootstrap/gvpie/gvpie-bootstrap/FREEZE_RITUAL.md` - Philosophy
- `gvpie_bootstrap/gvpie/gvpie-bootstrap/src/main.rs` - Implementation template
- `docs/PATTERN_EXTRACTION_METHOD.md` - Pattern extraction guide
- `docs/gvpie-patterns.md` - Extracted patterns
