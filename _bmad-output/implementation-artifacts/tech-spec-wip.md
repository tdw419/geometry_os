---
title: 'Keyboard→Mailbox Bridge'
slug: 'keyboard-mailbox-bridge'
created: '2026-03-18'
status: 'implemented'
stepsCompleted: [1, 2]
tech_stack: ['Rust', 'Glyph VM ISA', 'Synthetic VRAM']
files_to_modify: ['systems/infinite_map_rs/src/synthetic_vram.rs']
code_patterns: ['BEQ polling loop', 'SPATIAL_SPAWN', 'interleaved scheduling']
test_patterns: ['cargo test --lib', 'execute_frame_interleaved']
---

# Tech-Spec: Keyboard→Mailbox Bridge

**Created:** 2026-03-18

## Overview

### Problem Statement

Race condition in `test_keyboard_mailbox_bridge`: the child VM reads the mailbox before the compositor routes the scancode. With interleaved scheduling (`execute_frame_interleaved(1)`), both VMs run concurrently, and the child reads mailbox at cycle ~6 while the compositor hasn't finished routing the key yet.

### Solution

Add a BEQ polling loop to the child VM so it spins on the mailbox until a non-zero value arrives. This mirrors the pattern already proven in `test_text_buffer_vm`.

### Scope

**In Scope:**
- Fix child program in `test_keyboard_mailbox_bridge` with polling loop
- Verify test passes
- Update SOVEREIGNTY_LADDER.md to mark 10b complete

**Out of Scope:**
- Multi-key handling
- Focus changes
- Other milestones (10c, 10d, 10e)

## Context for Development

### Codebase Patterns

**Polling Loop Pattern (from test_text_buffer_vm):**
```rust
let poll_loop = cp;
vram.poke(cp, glyph(3, 0, addr_reg, dest_reg)); cp += 1; // LOAD dest, [addr]
vram.poke(cp, glyph(10, 0, dest_reg, 127)); cp += 1;     // BEQ dest, r127(=0)
vram.poke(cp, (poll_loop as i32 - cp as i32 - 1) as u32); cp += 1; // offset back
```

**Glyph ISA Key Opcodes:**
- `1` = LDI (load immediate)
- `3` = LOAD (mem[addr_reg] → dest_reg)
- `4` = STORE (val_reg → mem[addr_reg])
- `9` = JMP (PC-relative)
- `10` = BEQ (branch if equal)
- `13` = HALT
- `225` = SPATIAL_SPAWN

### Files to Reference

| File | Purpose |
| ---- | ------- |
| `systems/infinite_map_rs/src/synthetic_vram.rs:1288-1437` | test_keyboard_mailbox_bridge |
| `systems/infinite_map_rs/src/synthetic_vram.rs:1029-1286` | test_text_buffer_vm (reference pattern) |
| `docs/SOVEREIGNTY_LADDER.md` | Milestone documentation |

### Technical Decisions

1. **Polling over interrupts**: Child polls mailbox in spin loop because VM doesn't have interrupt mechanism
2. **BEQ with r127**: r127 is always 0, so `BEQ r1, r127` tests if r1 == 0
3. **Interleaved scheduling**: `execute_frame_interleaved(1)` ensures fair scheduling

## Implementation Plan

### Tasks

**Task 1: Child Polling Loop** (✅ COMPLETE)
- Location: `synthetic_vram.rs:1334-1344`
- Pattern: LOAD → BEQ → offset back to poll_loop

**Task 2: Update Documentation** (PENDING)
- Location: `docs/SOVEREIGNTY_LADDER.md`
- Mark 10b as ✅ Complete

### Acceptance Criteria

- [x] `test_keyboard_mailbox_bridge` passes
- [x] Child polls mailbox until non-zero
- [x] Key routed to focused window's mailbox
- [ ] SOVEREIGNTY_LADDER.md updated

## Additional Context

### Dependencies

- `test_text_buffer_vm` pattern (proven)
- `test_self_hosting_quine` (sovereignty baseline)

### Testing Strategy

```bash
cargo test --lib synthetic_vram::tests::test_keyboard_mailbox_bridge -- --nocapture
```

### Notes

The polling loop was already implemented in a previous session. The test now passes.
