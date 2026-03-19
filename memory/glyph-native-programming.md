---
name: Glyph-Native Programming Pattern
description: How to program with ASCII/Glyph instead of Rust
type: feedback
---

# Glyph-Native Programming Pattern

## The Rule

**Write logic in Glyph/ASCII, not in Rust.** The ASCII file IS the program.

## Why

Every time we add Rust code, we violate the core principle: "Pixels move pixels." The goal is GPU sovereignty - the program should run entirely on the GPU, with Rust only as a thin data pump.

## How to Apply

1. **Create `.ascii` file** - Write Glyph code with labels, opcodes, comments
2. **Use `geos-compile`** - Compile to PNG cartridge
3. **Minimal Rust** - Only data forwarding, no logic

### Example Pattern

**mailbox.ascii** (Glyph program):
```
; Event handling in Glyph
:main_loop
LDI r1, 0x0200
LOAD r2, mem[r1]    ; Read EVENT_TYPE
BEQ r2, r3, :event_done

; Handle events in Glyph, not Rust
:on_mouse_move
LDI r1, 0x0204
LOAD r2, mem[r1]    ; X
STORE mem[r4], r2   ; Update state
```

**Rust side** (minimal, no logic):
```rust
// Just forward events, Glyph interprets them
fn forward_event(event: winit::Event) {
    write_to_mailbox(0x0200, event);  // Done!
}
```

## Files

- `apps/ascii-world/.../examples/mailbox.ascii` - Glyph event handler
- `systems/glyph_stratum/programs/*.glyph` - Existing Glyph programs
- `geos-compile` - Compiles .ascii/.glyph → .rts.png

## Opcodes (Rust GlyphAssembler)

| Opcode | Format |
|--------|--------|
| LDI | `LDI r0, 42` or `LDI r0, :label` |
| LOAD | `LOAD r2, mem[r1]` |
| STORE | `STORE mem[r1], r0` |
| ADD | `ADD r2, r2, r3` |
| SUB | `SUB r4, r2, r3` |
| JMP | `JMP :label` |
| BEQ/BNE | `BEQ r1, r2, :label` |
| HALT | `HALT` |

## Anti-Patterns

- ❌ Writing event parsing logic in Rust
- ❌ Creating new Rust modules for things Glyph can do
- ❌ Adding "bridge" code in Rust

## Success Pattern

- ✅ ASCII file contains all logic
- ✅ Rust only pumps data
- ✅ GPU executes the program

---

*Learned: 2026-03-19*
