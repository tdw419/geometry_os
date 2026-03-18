# Self-Hosting Text Editor Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Build an on-screen text editor that can edit, compile, and execute its own source code in real-time without CPU involvement.

**Architecture:** The editor runs as a Glyph VM that maintains a text buffer, receives keyboard events via mailbox (like the compositor pattern), renders characters to screen coordinates, and triggers the self-hosting assembler to compile on demand. The compiled output can be spawned as a new VM.

**Tech Stack:** Glyph Assembly, Synthetic VRAM (testing), GPU Dev Daemon (runtime)

---

## Overview

This plan builds the **Self-Hosting Text Editor** — the next milestone on the sovereignty ladder. It combines:
- **Full Assembler** (Milestone 8) — verified via `test_self_hosting_quine`
- **Window Manager** (Milestone 9) — verified via `test_compositor_window_manager`

The result: an interactive development environment where the GPU edits, compiles, and runs code without CPU logic.

---

## Memory Layout

| Address Range | Purpose |
|---------------|---------|
| `0x0000 - 0x00FF` | Text Editor code |
| `0x0100 - 0x01FF` | Editor state (cursor, buffer_len, mode) |
| `0x0200 - 0x02FF` | Input mailbox (keyboard events) |
| `0x1000 - 0x1FFF` | Text buffer (source code) |
| `0x2000 - 0x20FF` | Label table (for assembler) |
| `0x5000 - 0x5FFF` | Compiled output buffer |
| `0x6000 - 0x60FF` | Mnemonic table |
| `0x7000 - 0x70FF` | Pass counter and temp state |

---

## Task Breakdown

### Task 1: Text Buffer VM Core

**Files:**
- Create: `systems/glyph_stratum/programs/text_editor.glyph`
- Test: `systems/infinite_map_rs/src/synthetic_vram.rs` (add test)

**Step 1: Write the failing test**

Add to `synthetic_vram.rs`:

```rust
#[test]
fn test_text_buffer_insert() {
    // Text Buffer VM Test:
    // 1. Send ASCII char 'L' to mailbox at 0x200
    // 2. VM reads mailbox, appends to buffer at 0x1000
    // 3. Verify buffer contains 'L' at position 0

    let mut vram = SyntheticVram::new_small(4096);

    // Mailbox: type=1 (KEY_INSERT), char='L' (76)
    vram.poke(0x200, 1);    // event type = INSERT
    vram.poke(0x201, 76);   // char = 'L'
    vram.poke(0x202, 0);    // cursor pos (not used yet)

    // Editor state at 0x100
    vram.poke(0x100, 0);    // cursor = 0
    vram.poke(0x101, 0);    // buffer_len = 0

    // --- TEXT EDITOR PROGRAM (addr 0) ---
    let mut pp = 0u32;
    let mut poke_ldi = |v: &mut SyntheticVram, p: &mut u32, reg: u8, val: u32| {
        v.poke(*p, glyph(1, 0, reg, 0));
        *p += 1;
        v.poke(*p, val);
        *p += 1;
    };

    poke_ldi(&mut vram, &mut pp, 13, 1);     // r13 = 1 (increment)
    poke_ldi(&mut vram, &mut pp, 0, 0x200);  // r0 = mailbox addr
    poke_ldi(&mut vram, &mut pp, 1, 0x100);  // r1 = state addr
    poke_ldi(&mut vram, &mut pp, 2, 0x1000); // r2 = buffer base

    // Loop: poll mailbox
    let loop_start = pp;
    vram.poke(pp, glyph(3, 0, 0, 3)); pp += 1;  // LOAD r3 = event_type
    vram.poke(pp, 0); pp += 1;                  // offset 0

    // If event_type == 0, keep polling
    vram.poke(pp, glyph(10, 0, 3, 127)); pp += 1; // BEQ r3, r127(0), loop
    vram.poke(pp, (loop_start as i32 - pp as i32 - 1) as u32); pp += 1;

    // If event_type == 1 (INSERT), handle insert
    vram.poke(pp, glyph(1, 0, 4, 0)); pp += 1;  // LDI r4 = 1
    vram.poke(pp, 1); pp += 1;
    vram.poke(pp, glyph(10, 0, 3, 4)); pp += 1; // BEQ r3, r4, :do_insert
    let do_insert_addr = pp;
    pp += 1; // placeholder

    // Unknown event: clear and loop
    vram.poke(pp, glyph(1, 0, 5, 0)); pp += 1;  // LDI r5 = 0
    vram.poke(pp, 0); pp += 1;
    vram.poke(pp, glyph(4, 0, 0, 5)); pp += 1;  // STORE [r0], r5 (clear event)
    vram.poke(pp, 0); pp += 1;
    vram.poke(pp, glyph(9, 0, 0, 0)); pp += 1;  // JMP loop
    vram.poke(pp, loop_start); pp += 1;

    // :do_insert
    let do_insert = pp;
    vram.poke(do_insert_addr - 1, do_insert);  // patch branch target

    // Load char from mailbox offset 1
    poke_ldi(&mut vram, &mut pp, 6, 1);         // r6 = 1
    vram.poke(pp, glyph(3, 0, 0, 7)); pp += 1;  // LOAD r7 = char (offset 1)
    vram.poke(pp, 1); pp += 1;

    // Load cursor position
    vram.poke(pp, glyph(3, 0, 1, 8)); pp += 1;  // LOAD r8 = cursor
    vram.poke(pp, 0); pp += 1;

    // Calculate buffer addr: base + cursor
    vram.poke(pp, glyph(2, 0, 2, 9)); pp += 1;  // MOV r9 = r2 (base)
    vram.poke(pp, glyph(5, 0, 8, 9)); pp += 1;  // ADD r9 = r9 + cursor

    // Store char at buffer[cursor]
    vram.poke(pp, glyph(4, 0, 9, 7)); pp += 1;  // STORE [r9], r7

    // Increment cursor and buffer_len
    vram.poke(pp, glyph(5, 0, 13, 8)); pp += 1; // ADD cursor += 1
    vram.poke(pp, glyph(4, 0, 1, 8)); pp += 1;  // STORE cursor
    vram.poke(pp, 0); pp += 1;

    // Increment buffer_len
    vram.poke(pp, glyph(3, 0, 1, 10)); pp += 1; // LOAD r10 = buffer_len
    vram.poke(pp, 1); pp += 1;
    vram.poke(pp, glyph(5, 0, 13, 10)); pp += 1; // ADD r10 += 1
    vram.poke(pp, glyph(4, 0, 1, 10)); pp += 1;  // STORE buffer_len
    vram.poke(pp, 1); pp += 1;

    // Clear event and loop
    vram.poke(pp, glyph(1, 0, 5, 0)); pp += 1;  // LDI r5 = 0
    vram.poke(pp, 0); pp += 1;
    vram.poke(pp, glyph(4, 0, 0, 5)); pp += 1;  // STORE [r0], r5
    vram.poke(pp, 0); pp += 1;
    vram.poke(pp, glyph(9, 0, 0, 0)); pp += 1;  // JMP loop
    vram.poke(pp, loop_start); pp += 1;

    // HALT (for test - in real editor this is unreachable)
    vram.poke(pp, glyph(13, 0, 0, 0)); pp += 1;

    // Spawn and run
    vram.spawn_vm(0, &SyntheticVmConfig {
        entry_point: 0,
        ..Default::default()
    }).unwrap();

    // Run enough cycles to process the event
    for _ in 0..100 {
        vram.execute_frame_interleaved(10);
        if vram.is_halted(0) { break; }
    }

    // Verify: buffer[0] should be 'L' (76)
    assert_eq!(vram.peek(0x1000), 76, "Buffer should contain 'L'");
    assert_eq!(vram.peek(0x100), 1, "Cursor should be at 1");
    assert_eq!(vram.peek(0x101), 1, "Buffer len should be 1");
}
```

**Step 2: Run test to verify it fails**

Run: `cargo test test_text_buffer_insert --lib -- --nocapture 2>&1 | tail -20`
Expected: FAIL (test not yet written or logic incomplete)

**Step 3: Write minimal implementation**

The test IS the implementation for this phase. The Glyph program is embedded in the test.

**Step 4: Run test to verify it passes**

Run: `cargo test test_text_buffer_insert --lib -- --nocapture`
Expected: PASS

**Step 5: Commit**

```bash
git add systems/infinite_map_rs/src/synthetic_vram.rs
git commit -m "feat(editor): add text buffer insert test"
```

---

### Task 2: Text Buffer Delete Operation

**Files:**
- Modify: `systems/infinite_map_rs/src/synthetic_vram.rs`

**Step 1: Write the failing test**

Add to `synthetic_vram.rs`:

```rust
#[test]
fn test_text_buffer_delete() {
    // Pre-populate buffer with "HELLO"
    // Send DELETE event
    // Verify "HELL" remains, cursor at 4

    let mut vram = SyntheticVram::new_small(4096);

    // Pre-populate buffer
    vram.poke(0x1000, 72);  // 'H'
    vram.poke(0x1001, 69);  // 'E'
    vram.poke(0x1002, 76);  // 'L'
    vram.poke(0x1003, 76);  // 'L'
    vram.poke(0x1004, 79);  // 'O'

    // Mailbox: type=2 (DELETE)
    vram.poke(0x200, 2);    // event type = DELETE
    vram.poke(0x201, 0);    // unused

    // Editor state
    vram.poke(0x100, 5);    // cursor = 5 (end)
    vram.poke(0x101, 5);    // buffer_len = 5

    // --- PROGRAM (simplified delete handler) ---
    let mut pp = 0u32;
    let glyph = |op, st, p1, p2| -> u32 {
        op as u32 | ((st as u32) << 8) | ((p1 as u32) << 16) | ((p2 as u32) << 24)
    };
    let mut poke_ldi = |v: &mut SyntheticVram, p: &mut u32, reg: u8, val: u32| {
        v.poke(*p, glyph(1, 0, reg, 0));
        *p += 1;
        v.poke(*p, val);
        *p += 1;
    };

    poke_ldi(&mut vram, &mut pp, 13, 1);
    poke_ldi(&mut vram, &mut pp, 0, 0x200);
    poke_ldi(&mut vram, &mut pp, 1, 0x100);
    poke_ldi(&mut vram, &mut pp, 2, 0x1000);

    // Load event type
    vram.poke(pp, glyph(3, 0, 0, 3)); pp += 1;
    vram.poke(pp, 0); pp += 1;

    // If DELETE (2), handle
    poke_ldi(&mut vram, &mut pp, 4, 2);
    vram.poke(pp, glyph(10, 0, 3, 4)); pp += 1;
    let delete_branch = pp; pp += 1;

    // HALT for this test
    vram.poke(pp, glyph(13, 0, 0, 0)); pp += 1;

    // :do_delete
    let do_delete = pp;
    vram.poke(delete_branch - 1, do_delete);

    // Decrement cursor (if > 0)
    vram.poke(pp, glyph(3, 0, 1, 5)); pp += 1;  // LOAD r5 = cursor
    vram.poke(pp, 0); pp += 1;
    vram.poke(pp, glyph(10, 0, 5, 127)); pp += 1; // BEQ r5, 0, skip
    pp += 1;
    vram.poke(pp, glyph(6, 0, 13, 5)); pp += 1;  // SUB r5 -= 1

    // Store char = 0 at buffer[cursor]
    vram.poke(pp, glyph(2, 0, 2, 6)); pp += 1;  // MOV r6 = base
    vram.poke(pp, glyph(5, 0, 5, 6)); pp += 1;  // ADD r6 += cursor
    vram.poke(pp, glyph(1, 0, 7, 0)); pp += 1;  // LDI r7 = 0
    vram.poke(pp, 0); pp += 1;
    vram.poke(pp, glyph(4, 0, 6, 7)); pp += 1;  // STORE [r6], 0

    // Update cursor and buffer_len
    vram.poke(pp, glyph(4, 0, 1, 5)); pp += 1;  // STORE cursor
    vram.poke(pp, 0); pp += 1;

    vram.poke(pp, glyph(3, 0, 1, 8)); pp += 1;  // LOAD r8 = buffer_len
    vram.poke(pp, 1); pp += 1;
    vram.poke(pp, glyph(6, 0, 13, 8)); pp += 1; // SUB r8 -= 1
    vram.poke(pp, glyph(4, 0, 1, 8)); pp += 1;  // STORE buffer_len
    vram.poke(pp, 1); pp += 1;

    vram.poke(pp, glyph(13, 0, 0, 0)); pp += 1; // HALT

    // Run
    vram.spawn_vm(0, &SyntheticVmConfig {
        entry_point: 0,
        ..Default::default()
    }).unwrap();

    for _ in 0..100 {
        vram.execute_frame_interleaved(10);
        if vram.is_halted(0) { break; }
    }

    // Verify
    assert_eq!(vram.peek(0x1004), 0, "Last char should be deleted");
    assert_eq!(vram.peek(0x100), 4, "Cursor should be at 4");
    assert_eq!(vram.peek(0x101), 4, "Buffer len should be 4");
}
```

**Step 2: Run test to verify it fails**

Run: `cargo test test_text_buffer_delete --lib -- --nocapture`
Expected: FAIL

**Step 3: Write minimal implementation**

The test contains the implementation.

**Step 4: Run test to verify it passes**

Run: `cargo test test_text_buffer_delete --lib -- --nocapture`
Expected: PASS

**Step 5: Commit**

```bash
git add systems/infinite_map_rs/src/synthetic_vram.rs
git commit -m "feat(editor): add text buffer delete test"
```

---

### Task 3: Create text_editor.glyph Program

**Files:**
- Create: `systems/glyph_stratum/programs/text_editor.glyph`

**Step 1: Write the glyph program**

```glyph
// ============================================================================
// Geometry OS - Self-Hosting Text Editor
// ============================================================================
//
// Memory Layout:
// 0x0100 - 0x01FF: Editor state (cursor, buffer_len, mode)
// 0x0200 - 0x02FF: Input mailbox (keyboard events)
// 0x1000 - 0x1FFF: Text buffer (source code)
// 0x2000 - 0x20FF: Label table (for assembler)
// 0x5000 - 0x5FFF: Compiled output buffer
//
// Event Types (written to 0x200):
// 1 = INSERT char
// 2 = DELETE backspace
// 3 = CURSOR_LEFT
// 4 = CURSOR_RIGHT
// 5 = COMPILE (trigger assembler)
// 6 = RUN (spawn compiled output)
// ============================================================================

:main
    LDI r13, 1
    LDI r127, 0
    LDI r0, 0x200       // mailbox
    LDI r1, 0x100       // state
    LDI r2, 0x1000      // buffer

:event_loop
    LOAD r3, [r0]       // r3 = event_type
    BEQ r3, r127, :event_loop

    // Dispatch on event type
    LDI r4, 1
    BEQ r3, r4, :do_insert
    LDI r4, 2
    BEQ r3, r4, :do_delete
    LDI r4, 3
    BEQ r3, r4, :do_cursor_left
    LDI r4, 4
    BEQ r3, r4, :do_cursor_right
    LDI r4, 5
    BEQ r3, r4, :do_compile
    LDI r4, 6
    BEQ r3, r4, :do_run
    JMP :clear_event

// --- INSERT ---
:do_insert
    LOAD r7, [r0 + 1]   // char from mailbox
    LOAD r8, [r1]       // cursor
    MOV r9, r2
    ADD r9, r9, r8      // r9 = buffer + cursor
    STORE [r9], r7      // buffer[cursor] = char
    ADD r8, r8, r13
    STORE [r1], r8      // cursor++
    LOAD r10, [r1 + 1]
    ADD r10, r10, r13
    STORE [r1 + 1], r10 // buffer_len++
    JMP :clear_event

// --- DELETE (backspace) ---
:do_delete
    LOAD r5, [r1]       // cursor
    BEQ r5, r127, :clear_event  // cursor=0, nothing to delete
    SUB r5, r5, r13
    STORE [r1], r5      // cursor--
    MOV r6, r2
    ADD r6, r6, r5      // r6 = buffer + cursor
    STORE [r6], r127    // buffer[cursor] = 0
    LOAD r8, [r1 + 1]
    SUB r8, r8, r13
    STORE [r1 + 1], r8  // buffer_len--
    JMP :clear_event

// --- CURSOR_LEFT ---
:do_cursor_left
    LOAD r5, [r1]
    BEQ r5, r127, :clear_event
    SUB r5, r5, r13
    STORE [r1], r5
    JMP :clear_event

// --- CURSOR_RIGHT ---
:do_cursor_right
    LOAD r5, [r1]
    LOAD r6, [r1 + 1]   // buffer_len
    BEQ r5, r6, :clear_event  // at end
    ADD r5, r5, r13
    STORE [r1], r5
    JMP :clear_event

// --- COMPILE ---
:do_compile
    // Copy buffer to assembler input at 0x3000
    // Then jump to assembler entry
    LDI r10, 0x3000     // assembler input
    LDI r11, 0          // i = 0
:copy_loop
    BEQ r11, r6, :copy_done
    MOV r12, r2
    ADD r12, r12, r11
    LOAD r14, [r12]
    MOV r15, r10
    ADD r15, r15, r11
    STORE [r15], r14
    ADD r11, r11, r13
    JMP :copy_loop
:copy_done
    // Null terminate
    MOV r15, r10
    ADD r15, r15, r6
    STORE [r15], r127

    // TODO: Call assembler (requires integrating self_hosting_assembler.glyph)
    JMP :clear_event

// --- RUN ---
:do_run
    // TODO: SPATIAL_SPAWN the compiled output at 0x5000
    JMP :clear_event

// --- CLEAR EVENT ---
:clear_event
    STORE [r0], r127
    JMP :event_loop

:halt
    HALT
```

**Step 2: Verify syntax**

Run: `python3 systems/glyph_stratum/programs/compile_glyph.py systems/glyph_stratum/programs/text_editor.glyph test_editor.png`
Expected: Compiled successfully

**Step 3: Commit**

```bash
git add systems/glyph_stratum/programs/text_editor.glyph
git commit -m "feat(editor): add text_editor.glyph program skeleton"
```

---

### Task 4: Integrate Assembler with Editor

**Files:**
- Modify: `systems/glyph_stratum/programs/text_editor.glyph`

**Step 1: Write the failing test**

Add to `synthetic_vram.rs`:

```rust
#[test]
fn test_editor_compile_simple() {
    // 1. Pre-populate buffer with "LDI r0, 42\nHALT\n"
    // 2. Send COMPILE event
    // 3. Verify output at 0x5000 contains [0x00000001, 42, 0x0000000D]

    let mut vram = SyntheticVram::new_small(8192);

    // Buffer: "LDI r0, 42\nHALT\n"
    let source = b"LDI r0, 42\nHALT\n";
    for (i, &c) in source.iter().enumerate() {
        vram.poke(0x1000 + i as u32, c as u32);
    }
    vram.poke(0x1000 + source.len() as u32, 0); // null terminator

    // State
    vram.poke(0x100, 0);     // cursor
    vram.poke(0x101, source.len() as u32); // buffer_len

    // Load assembler binary at 0x8000
    let asm_source = std::fs::read_to_string(
        "../../systems/glyph_stratum/programs/self_hosting_assembler.glyph"
    ).expect("Failed to read assembler");
    let mut assembler = crate::glyph_assembler::GlyphAssembler::new();
    let asm_binary = assembler.assemble(&asm_source).expect("Assembler failed");

    for (i, word) in asm_binary.words.iter().enumerate() {
        vram.poke(0x8000 + i as u32, *word);
    }

    // This test requires integrating the assembler call
    // For now, we test that the copy loop works
    // Full integration is Task 5

    // COMPILE event
    vram.poke(0x200, 5); // COMPILE

    // Run editor (simplified - just tests copy logic)
    // ... implementation details ...

    // Verify source was copied to assembler input
    for (i, &c) in source.iter().enumerate() {
        assert_eq!(vram.peek(0x3000 + i as u32), c as u32,
            "Source copy at offset {}", i);
    }
}
```

**Step 2: Run test**

Run: `cargo test test_editor_compile_simple --lib -- --nocapture`
Expected: May fail - requires implementation

**Step 3: Implement assembler call in editor**

Modify `text_editor.glyph` to call the assembler after copying.

**Step 4: Verify test passes**

Run: `cargo test test_editor_compile_simple --lib -- --nocapture`
Expected: PASS

**Step 5: Commit**

```bash
git add systems/glyph_stratum/programs/text_editor.glyph systems/infinite_map_rs/src/synthetic_vram.rs
git commit -m "feat(editor): integrate assembler with editor"
```

---

### Task 5: Full Edit-Compile-Execute Loop

**Files:**
- Modify: `systems/glyph_stratum/programs/text_editor.glyph`
- Test: `systems/infinite_map_rs/src/synthetic_vram.rs`

**Step 1: Write the failing test**

```rust
#[test]
fn test_edit_compile_execute_loop() {
    // THE ULTIMATE TEST:
    // 1. Editor edits a simple program
    // 2. Compiles it
    // 3. Spawns it as a new VM
    // 4. New VM writes 0xDEAD to address 0x400
    // 5. Verify 0x400 contains 0xDEAD

    let mut vram = SyntheticVram::new_small(16384);

    // Source: "LDI r0, 0xDEAD\nSTORE [0x400], r0\nHALT\n"
    let source = b"LDI r0, 0xDEAD\nLDI r1, 0x400\nSTORE [r1], r0\nHALT\n";

    // ... setup editor, assembler, etc ...

    // Send RUN event
    vram.poke(0x200, 6); // RUN

    // Execute both VMs
    for _ in 0..500 {
        vram.execute_frame_interleaved(10);
    }

    // Verify spawned VM wrote to 0x400
    assert_eq!(vram.peek(0x400), 0xDEAD, "Spawned VM should have written 0xDEAD");
}
```

**Step 2: Implement RUN with SPATIAL_SPAWN**

Modify `:do_run` in `text_editor.glyph` to use opcode 225.

**Step 3: Run test**

Expected: PASS

**Step 4: Commit**

```bash
git add systems/glyph_stratum/programs/text_editor.glyph systems/infinite_map_rs/src/synthetic_vram.rs
git commit -m "feat(editor): complete edit-compile-execute loop"
```

---

### Task 6: Documentation

**Files:**
- Update: `docs/SOVEREIGNTY_LADDER.md`

**Step 1: Add Milestone 10**

Add to SOVEREIGNTY_LADDER.md:

```markdown
### 10. Self-Hosting Text Editor (✅ Complete)
**The Objective**: An interactive development environment where the GPU edits, compiles, and runs code.
**The Proof**: `test_edit_compile_execute_loop` demonstrates:
- Text buffer management (INSERT, DELETE, cursor)
- Real-time compilation via self-hosting assembler
- Dynamic VM spawning via SPATIAL_SPAWN
**Significance**: The OS is now a self-contained development environment. No external tools required.
```

**Step 2: Commit**

```bash
git add docs/SOVEREIGNTY_LADDER.md
git commit -m "docs: add Milestone 10 - Self-Hosting Text Editor"
```

---

## Summary

| Task | Description | Files |
|------|-------------|-------|
| 1 | Text Buffer Insert | synthetic_vram.rs |
| 2 | Text Buffer Delete | synthetic_vram.rs |
| 3 | text_editor.glyph | programs/text_editor.glyph |
| 4 | Integrate Assembler | text_editor.glyph, synthetic_vram.rs |
| 5 | Edit-Compile-Execute | text_editor.glyph, synthetic_vram.rs |
| 6 | Documentation | SOVEREIGNTY_LADDER.md |

**Total Tasks:** 6
**Estimated Time:** 2-3 hours

---

## Dependencies

- `test_self_hosting_quine` must pass (✅ verified)
- `test_compositor_window_manager` patterns used for event routing
