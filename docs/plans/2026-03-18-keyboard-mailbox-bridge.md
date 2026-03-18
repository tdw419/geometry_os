# Milestone 10b: Keyboard→Mailbox Bridge Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Fix the keyboard routing test so the compositor successfully routes scancodes to a focused child window's mailbox, and the child receives them via polling.

**Architecture:** The compositor (VM 0) reads keyboard state from a shared memory region, checks window focus, and routes scancodes to the focused window's mailbox. The child (VM 1) polls its mailbox until a key arrives, then processes it. This mirrors the event routing pattern from the Window Manager milestone.

**Tech Stack:** Rust (Synthetic VRAM), Glyph VM ISA, interleaved scheduling

---

## Problem Analysis

The existing `test_keyboard_mailbox_bridge` test fails because of a **race condition**:

1. Compositor spawns child VM (starts at entry point 400)
2. With interleaved scheduling, both VMs run concurrently
3. Child reads mailbox at cycle 6 — **before compositor routes the key**
4. Child stores 0 to buffer, halts
5. Compositor eventually routes key to mailbox — but child already halted

**Solution:** Child must poll mailbox in a loop (spin until non-zero), same pattern as `test_text_buffer_vm`.

---

## Task 1: Fix Child Program with Polling Loop

**Files:**
- Modify: `systems/infinite_map_rs/src/synthetic_vram.rs:1317-1342`

**Step 1: Read current child program**

The current child program at lines 1317-1342:
```rust
// --- CHILD PROGRAM (Text Buffer at 400) ---
// Simplified: read mailbox, store to 0x400, halt
let mut cp = 400;
// r0 = 0x300 (mailbox)
// r1 = [r0] (read key)
// r0 = 0x400 (buffer)
// [r0] = r1 (store key)
// HALT
```

This reads once without waiting.

**Step 2: Write the failing test verification**

The test already fails. Run to confirm:

Run: `cargo test --lib synthetic_vram::tests::test_keyboard_mailbox_bridge -- --nocapture 2>&1 | tail -15`

Expected: FAIL with "Child should receive key"

**Step 3: Implement polling loop in child program**

Replace lines 1317-1342 with:

```rust
// --- CHILD PROGRAM (Text Buffer at 400) ---
// Polls mailbox until key arrives, stores to buffer, halts
let mut cp = 400;

let mut emit_ldi = |v: &mut SyntheticVram, p: &mut u32, reg: u8, val: u32| {
    v.poke(*p, glyph(1, 0, reg, 0));
    *p += 1;
    v.poke(*p, val);
    *p += 1;
};

// r0 = 0x300 (mailbox address)
emit_ldi(&mut vram, &mut cp, 0, 0x300);

// r2 = 0x400 (buffer address)
emit_ldi(&mut vram, &mut cp, 2, 0x400);

let poll_loop = cp;

// r1 = [r0] (read mailbox)
vram.poke(cp, glyph(3, 0, 0, 1)); cp += 1; // LOAD r1, [r0]

// if r1 == 0, loop back to poll
vram.poke(cp, glyph(10, 0, 1, 127)); cp += 1; // BEQ r1, r127(=0)
vram.poke(cp, (poll_loop as i32 - cp as i32 - 1) as u32); cp += 1; // offset to poll_loop

// [r2] = r1 (store key to buffer)
vram.poke(cp, glyph(4, 0, 2, 1)); cp += 1; // STORE [r2], r1

// HALT
vram.poke(cp, glyph(13, 0, 0, 0)); cp += 1;
```

**Step 4: Run test to verify it passes**

Run: `cargo test --lib synthetic_vram::tests::test_keyboard_mailbox_bridge -- --nocapture 2>&1 | tail -15`

Expected:
```
Program size: 18 words
✓ Key routing to focused window works
✓ Milestone 10b: Keyboard→Mailbox Bridge — PASSED
test result: ok. 1 passed
```

**Step 5: Commit**

```bash
git add systems/infinite_map_rs/src/synthetic_vram.rs
git commit -m "fix(infinite_map): add polling loop to keyboard mailbox bridge child

The child VM now polls its mailbox in a spin loop until a key arrives,
fixing the race condition where the child read the mailbox before the
compositor routed the key.

Milestone 10b: Keyboard→Mailbox Bridge"
```

---

## Task 2: Add Multi-Key Test Case

**Files:**
- Modify: `systems/infinite_map_rs/src/synthetic_vram.rs:1418-1428`

**Step 1: Add test for multiple key presses**

After line 1427 (the final println), add a new test scenario:

```rust
// Test 2: Multiple keys in sequence
println!("\n--- Test 2: Multiple keys ---");

// Reset state
vram.poke(0x300, 0); // clear mailbox
vram.poke(0x400, 0); // clear buffer

// Spawn fresh child at entry point 400
vram.spawn_vm(1, &SyntheticVmConfig::default()).unwrap();
vram.vms[1].pc = 400;
vram.vms[1].entry_point = 400;
vram.vms[1].state = VM_STATE_RUNNING;

// Route 'e' (0x65)
vram.poke(0x200, 0x65);
vram.execute_frame_interleaved(50);
assert_eq!(vram.peek(0x400), 0x65, "Second key should be received");

println!("✓ Multiple key routing works");
```

**Step 2: Run test to verify**

Run: `cargo test --lib synthetic_vram::tests::test_keyboard_mailbox_bridge -- --nocapture 2>&1 | tail -20`

Expected: PASS with "Multiple key routing works"

**Step 3: Commit**

```bash
git add systems/infinite_map_rs/src/synthetic_vram.rs
git commit -m "test(infinite_map): add multi-key test to keyboard mailbox bridge"
```

---

## Task 3: Update SOVEREIGNTY_LADDER.md

**Files:**
- Modify: `docs/SOVEREIGNTY_LADDER.md:65-67`

**Step 1: Update milestone status**

Change line 65-67 from:
```markdown
### 10b. Keyboard→Mailbox Bridge (🔜 Next)
**The Objective**: The compositor routes keyboard scancodes to the focused window's mailbox.
**Builds on**: Window Manager (Milestone 9) + Text Buffer VM (10a).
```

To:
```markdown
### 10b. Keyboard→Mailbox Bridge (✅ Complete)
**The Objective**: The compositor routes keyboard scancodes to the focused window's mailbox.
**The Proof**: `test_keyboard_mailbox_bridge` — compositor (VM 0) reads keyboard state from shared memory, checks window focus flag, routes scancode to mailbox. Child (VM 1) polls mailbox until key arrives, demonstrating event-driven IPC.
**Significance**: The keyboard input pipeline is complete. Keyboards events flow through the same mailbox protocol as mouse events.
**Builds on**: Window Manager (Milestone 9) + Text Buffer VM (10a).
```

Also update line 69 to mark 10c as "🔜 Next":
```markdown
### 10c. Live Render (🔜 Next)
```

**Step 2: Run tests to verify nothing broke**

Run: `cargo test --lib synthetic_vram::tests::test_keyboard_mailbox_bridge synthetic_vram::tests::test_text_buffer_vm synthetic_vram::tests::test_self_hosting_quine -- --nocapture 2>&1 | grep -E "(✓|✅|PASSED|FAILED|test result)"`

Expected: All 3 tests PASS

**Step 3: Commit**

```bash
git add docs/SOVEREIGNTY_LADDER.md
git commit -m "docs: mark Milestone 10b Keyboard→Mailbox Bridge complete"
```

---

## Verification Checklist

Before claiming completion:

- [ ] `test_keyboard_mailbox_bridge` passes
- [ ] `test_text_buffer_vm` still passes (no regression)
- [ ] `test_self_hosting_quine` still passes (no regression)
- [ ] SOVEREIGNTY_LADDER.md updated with ✅ Complete status
- [ ] All commits made with descriptive messages

---

## Summary

| Task | Description | Key Change |
|------|-------------|------------|
| 1 | Fix child polling loop | Add BEQ spin loop to child |
| 2 | Add multi-key test | Verify sequential key routing |
| 3 | Update docs | Mark milestone complete |

**Root cause:** Race condition — child read mailbox before compositor routed key.

**Fix:** Child polls mailbox in spin loop (same pattern as text_buffer_vm).
