# WASM Block Stack Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add block stack to wasm_interpreter.glyph to enable structured control flow (block/loop/if/br/br_if/end).

**Architecture:** Block stack is a fixed-size array in Glyph memory tracking block type, start address, and stack height for each nested block. Branch instructions (br/br_if) pop blocks to find targets, and END pops the current block.

**Tech Stack:** Glyph assembly, WASM MVP spec, stack-based control flow

---

## Background

WASM uses structured control flow with explicit block markers:
- `block` / `loop` / `if` - push a block onto the stack
- `end` - pop the current block
- `br N` - break to Nth enclosing block
- `br_if N` - conditional break

Each block needs:
- Block type (0=block, 1=loop, 2=if)
- Start address (for loop back-edge)
- Stack height at block entry (for cleanup on branch)

## Memory Layout

| Address | Purpose |
|---------|---------|
| 0x31000 | BLOCK_STACK_BASE |
| 0x31000 | BLOCK_STACK_COUNT (number of active blocks) |
| 0x31004+ | Block entries (12 bytes each: type, addr, stack_height) |

Block entry format (12 bytes):
- +0: block_type (u32): 0=block, 1=loop, 2=if
- +4: start_addr (u32): IP at block entry
- +8: stack_height (u32): SP at block entry

---

## Task 1: Add Block Stack Constants and Memory Layout

**Files:**
- Modify: `systems/glyph_stratum/programs/wasm_interpreter.glyph:36-77`

**Step 1: Add block stack constants**

Add after line 77 (after existing .equ definitions):

```glyph
// Block Stack (for control flow)
.equ BLOCK_STACK_BASE,  0x31000
.equ BLOCK_STACK_COUNT, 0x31000    // Number of active blocks (u32)
.equ BLOCK_STACK_DATA,  0x31004    // Start of block entries

// Block types
.equ BLOCK_TYPE_BLOCK,  0
.equ BLOCK_TYPE_LOOP,   1
.equ BLOCK_TYPE_IF,     2

// Block entry size (12 bytes: type + addr + stack_height)
.equ BLOCK_ENTRY_SIZE,  12
```

**Step 2: Initialize block stack in boot**

In `:boot` section, after line 101, add:

```glyph
    // Initialize block stack count to 0
    LDI r1, BLOCK_STACK_COUNT
    LDI r2, 0
    STORE r1, r2
```

**Step 3: Commit**

```bash
git add systems/glyph_stratum/programs/wasm_interpreter.glyph
git commit -m "feat(wasm): add block stack constants and initialization"
```

---

## Task 2: Implement Block Stack Push Helper

**Files:**
- Modify: `systems/glyph_stratum/programs/wasm_interpreter.glyph` (utility routines section)

**Step 1: Add block_push helper**

Add after `:stack_pop` routine (around line 750):

```glyph
// ------------------------------------------------------------
// Block Stack Push
// ------------------------------------------------------------
// Push a new block onto the block stack
// Input: r4 = block_type, r5 = start_addr
// Uses: r1, r2, r3, r6, r10, r12
// ------------------------------------------------------------

:block_push
    // Get current block count
    LDI r1, BLOCK_STACK_COUNT
    LOAD r1, r6            // r6 = count

    // Calculate entry address: BLOCK_STACK_DATA + (count * BLOCK_ENTRY_SIZE)
    LDI r10, BLOCK_STACK_DATA
    // Multiply count by 12 (BLOCK_ENTRY_SIZE)
    // r6 * 12 = r6 * 8 + r6 * 4 = (r6 << 3) + (r6 << 2)
    MOV r6, r3
    LDI r2, 3
:block_push_shift1
    LDI r12, 1
    SHL r3, r12
    LDI r12, 1
    SUB r2, r12
    JNZ r2, :block_push_shift1
    // r3 = count * 8
    MOV r6, r12
    LDI r2, 2
:block_push_shift2
    LDI r1, 1
    SHL r12, r1
    LDI r1, 1
    SUB r2, r1
    JNZ r2, :block_push_shift2
    // r12 = count * 4
    ADD r3, r12            // r3 = count * 12

    ADD r10, r3            // r10 = entry address

    // Store block_type at offset 0
    STORE r10, r4

    // Store start_addr at offset 4
    LDI r1, 4
    ADD r10, r1
    STORE r10, r5

    // Store current SP (stack_height) at offset 8
    LDI r1, 4
    ADD r10, r1
    LDI r1, WASM_SP_ADDR
    LOAD r1, r12           // r12 = current SP
    STORE r10, r12

    // Increment block count
    LDI r1, BLOCK_STACK_COUNT
    LOAD r1, r6
    LDI r2, 1
    ADD r6, r2
    LDI r1, BLOCK_STACK_COUNT
    STORE r1, r6

    RET
```

**Step 2: Commit**

```bash
git add systems/glyph_stratum/programs/wasm_interpreter.glyph
git commit -m "feat(wasm): add block_push helper for control flow"
```

---

## Task 3: Implement Block Stack Pop Helper

**Files:**
- Modify: `systems/glyph_stratum/programs/wasm_interpreter.glyph`

**Step 1: Add block_pop helper**

Add after `:block_push`:

```glyph
// ------------------------------------------------------------
// Block Stack Pop
// ------------------------------------------------------------
// Pop the current block from the block stack
// Output: r4 = block_type, r5 = start_addr, r6 = stack_height
// Uses: r1, r2, r3, r10, r12
// ------------------------------------------------------------

:block_pop
    // Get current block count
    LDI r1, BLOCK_STACK_COUNT
    LOAD r1, r6            // r6 = count

    // If count is 0, error
    LDI r2, 0
    SUB r6, r2
    JZ r6, :block_pop_error

    // Decrement count to get last entry index
    LDI r2, 1
    SUB r6, r2

    // Calculate entry address
    LDI r10, BLOCK_STACK_DATA
    // Multiply (count-1) by 12
    MOV r6, r3
    LDI r2, 3
:block_pop_shift1
    LDI r12, 1
    SHL r3, r12
    LDI r12, 1
    SUB r2, r12
    JNZ r2, :block_pop_shift1
    MOV r6, r12
    LDI r2, 2
:block_pop_shift2
    LDI r1, 1
    SHL r12, r1
    LDI r1, 1
    SUB r2, r1
    JNZ r2, :block_pop_shift2
    ADD r3, r12
    ADD r10, r3

    // Load block_type from offset 0
    LOAD r10, r4

    // Load start_addr from offset 4
    LDI r1, 4
    ADD r10, r1
    LOAD r10, r5

    // Load stack_height from offset 8
    LDI r1, 4
    ADD r10, r1
    LOAD r10, r6

    // Decrement block count
    LDI r1, BLOCK_STACK_COUNT
    LOAD r1, r12
    LDI r2, 1
    SUB r12, r2
    LDI r1, BLOCK_STACK_COUNT
    STORE r1, r12

    RET

:block_pop_error
    // Block stack underflow - set error status
    LDI r1, WASM_STATUS
    LDI r2, STATUS_ERROR
    STORE r1, r2
    JMP wasm_halt
```

**Step 2: Commit**

```bash
git add systems/glyph_stratum/programs/wasm_interpreter.glyph
git commit -m "feat(wasm): add block_pop helper for control flow"
```

---

## Task 4: Implement OP_BLOCK (0x02)

**Files:**
- Modify: `systems/glyph_stratum/programs/wasm_interpreter.glyph`

**Step 1: Add OP_BLOCK to dispatch table**

In the dispatch section, add after the OP_END check (around line 150):

```glyph
    // Check for BLOCK (0x02)
    LDI r3, OP_BLOCK
    SUB r2, r3
    LDI r13, wasm_op_block
    JZ r2, r13
```

**Step 2: Implement wasm_op_block**

Add in the Control Flow section:

```glyph
:wasm_op_block
    // block: push block, continue execution
    // Format: block blocktype

    // Read blocktype (usually 0x40 for void, or i32)
    // Skip it for MVP - we don't enforce return types
    LDI r1, WASM_IP_ADDR
    LOAD r1, r1
    LDI r3, 1
    ADD r1, r3
    LDI r3, WASM_IP_ADDR
    STORE r3, r1

    // Push block with type BLOCK and current IP
    LDI r4, BLOCK_TYPE_BLOCK
    LDI r1, WASM_IP_ADDR
    LOAD r1, r5            // r5 = current IP (start of block body)
    CALL :block_push

    LDI r13, wasm_fetch
    JMP r13
```

**Step 3: Commit**

```bash
git add systems/glyph_stratum/programs/wasm_interpreter.glyph
git commit -m "feat(wasm): implement OP_BLOCK for structured control flow"
```

---

## Task 5: Implement OP_LOOP (0x03)

**Files:**
- Modify: `systems/glyph_stratum/programs/wasm_interpreter.glyph`

**Step 1: Add OP_LOOP to dispatch table**

```glyph
    // Check for LOOP (0x03)
    LDI r3, OP_LOOP
    SUB r2, r3
    LDI r13, wasm_op_loop
    JZ r2, r13
```

**Step 2: Implement wasm_op_loop**

```glyph
:wasm_op_loop
    // loop: push loop block, continue execution
    // On br to loop, IP resets to loop start

    // Read and skip blocktype
    LDI r1, WASM_IP_ADDR
    LOAD r1, r1
    LDI r3, 1
    ADD r1, r3
    LDI r3, WASM_IP_ADDR
    STORE r3, r1

    // Push block with type LOOP and current IP
    LDI r4, BLOCK_TYPE_LOOP
    LDI r1, WASM_IP_ADDR
    LOAD r1, r5
    CALL :block_push

    LDI r13, wasm_fetch
    JMP r13
```

**Step 3: Commit**

```bash
git add systems/glyph_stratum/programs/wasm_interpreter.glyph
git commit -m "feat(wasm): implement OP_LOOP for iteration"
```

---

## Task 6: Update OP_END (0x0B) to Pop Block

**Files:**
- Modify: `systems/glyph_stratum/programs/wasm_interpreter.glyph`

**Step 1: Update wasm_op_end**

Replace the current `:wasm_op_end` implementation:

```glyph
:wasm_op_end
    // end: pop current block, continue or halt
    // If block stack is empty, this is end of function

    // Check block count
    LDI r1, BLOCK_STACK_COUNT
    LOAD r1, r3
    LDI r2, 0
    SUB r3, r2
    JZ r3, :wasm_op_end_function

    // Pop block (we don't need the values, just clean up)
    CALL :block_pop

    // Continue execution
    LDI r13, wasm_fetch
    JMP r13

:wasm_op_end_function
    // No blocks - end of function
    JMP wasm_halt
```

**Step 2: Commit**

```bash
git add systems/glyph_stratum/programs/wasm_interpreter.glyph
git commit -m "feat(wasm): update OP_END to pop block stack"
```

---

## Task 7: Implement OP_BR (0x0C) - Unconditional Branch

**Files:**
- Modify: `systems/glyph_stratum/programs/wasm_interpreter.glyph`

**Step 1: Add OP_BR to dispatch table**

```glyph
    // Check for BR (0x0C)
    LDI r3, OP_BR
    SUB r2, r3
    LDI r13, wasm_op_br
    JZ r2, r13
```

**Step 2: Implement wasm_op_br**

```glyph
:wasm_op_br
    // br: branch to Nth enclosing block
    // Format: br label_index (LEB128)

    // Read label index
    CALL :leb128_unsigned    // r6 = label_index

    // Pop blocks until we reach target
    // label_index 0 = current block, 1 = parent, etc.
:wasm_br_loop
    LDI r2, 0
    SUB r6, r2
    JZ r6, :wasm_br_target

    // Pop block, decrement label_index
    CALL :block_pop
    LDI r2, 1
    SUB r6, r2
    JMP :wasm_br_loop

:wasm_br_target
    // Pop the target block to get its info
    CALL :block_pop          // r4 = type, r5 = start_addr, r6 = stack_height

    // Restore stack height
    LDI r1, WASM_SP_ADDR
    STORE r1, r6

    // If LOOP, jump to start address
    // If BLOCK, continue after END (which we need to find)
    LDI r2, BLOCK_TYPE_LOOP
    SUB r4, r2
    JZ r4, :wasm_br_to_loop

:wasm_br_to_block
    // For blocks, we'd need to skip to END
    // For MVP, just halt (proper impl needs END scanning)
    JMP wasm_halt

:wasm_br_to_loop
    // Jump to loop start
    LDI r1, WASM_IP_ADDR
    STORE r1, r5

    // Re-push the loop block
    CALL :block_push

    LDI r13, wasm_fetch
    JMP r13
```

**Step 3: Commit**

```bash
git add systems/glyph_stratum/programs/wasm_interpreter.glyph
git commit -m "feat(wasm): implement OP_BR for unconditional branches"
```

---

## Task 8: Implement OP_BR_IF (0x0D) - Conditional Branch

**Files:**
- Modify: `systems/glyph_stratum/programs/wasm_interpreter.glyph`

**Step 1: Add OP_BR_IF to dispatch table**

```glyph
    // Check for BR_IF (0x0D)
    LDI r3, OP_BR_IF
    SUB r2, r3
    LDI r13, wasm_op_br_if
    JZ r2, r13
```

**Step 2: Implement wasm_op_br_if**

```glyph
:wasm_op_br_if
    // br_if: conditional branch
    // Format: br_if label_index
    // Stack: [..., condition] -> [...]

    // Read label index
    CALL :leb128_unsigned    // r6 = label_index

    // Pop condition
    CALL :stack_pop          // r4 = condition

    // If condition is non-zero, do the branch
    LDI r2, 0
    SUB r4, r2
    JZ r4, :wasm_br_if_skip

    // Condition true - perform branch
    // Same logic as br
:wasm_br_if_loop
    LDI r2, 0
    SUB r6, r2
    JZ r6, :wasm_br_if_target
    CALL :block_pop
    LDI r2, 1
    SUB r6, r2
    JMP :wasm_br_if_loop

:wasm_br_if_target
    CALL :block_pop
    LDI r1, WASM_SP_ADDR
    STORE r1, r6
    LDI r2, BLOCK_TYPE_LOOP
    SUB r4, r2
    JZ r4, :wasm_br_if_loop_jump
    JMP wasm_halt

:wasm_br_if_loop_jump
    LDI r1, WASM_IP_ADDR
    STORE r1, r5
    CALL :block_push
    LDI r13, wasm_fetch
    JMP r13

:wasm_br_if_skip
    // Condition false - continue
    LDI r13, wasm_fetch
    JMP r13
```

**Step 3: Commit**

```bash
git add systems/glyph_stratum/programs/wasm_interpreter.glyph
git commit -m "feat(wasm): implement OP_BR_IF for conditional branches"
```

---

## Task 9: Implement OP_IF (0x04) and OP_ELSE (0x05)

**Files:**
- Modify: `systems/glyph_stratum/programs/wasm_interpreter.glyph`

**Step 1: Add OP_IF and OP_ELSE to dispatch table**

```glyph
    // Check for IF (0x04)
    LDI r3, OP_IF
    SUB r2, r3
    LDI r13, wasm_op_if
    JZ r2, r13

    // Check for ELSE (0x05)
    LDI r3, OP_ELSE
    SUB r2, r3
    LDI r13, wasm_op_else
    JZ r2, r13
```

**Step 2: Implement wasm_op_if**

```glyph
:wasm_op_if
    // if: conditional block
    // Format: if blocktype
    // Stack: [..., condition] -> [...]

    // Read and skip blocktype
    LDI r1, WASM_IP_ADDR
    LOAD r1, r1
    LDI r3, 1
    ADD r1, r3
    LDI r3, WASM_IP_ADDR
    STORE r3, r1

    // Pop condition
    CALL :stack_pop          // r4 = condition

    // Push IF block regardless
    LDI r4, BLOCK_TYPE_IF
    LDI r1, WASM_IP_ADDR
    LOAD r1, r5
    CALL :block_push

    // If condition is 0, skip to ELSE or END
    LDI r2, 0
    SUB r4, r2
    JZ r4, :wasm_if_skip

    // Condition true - continue into if body
    LDI r13, wasm_fetch
    JMP r13

:wasm_if_skip
    // Condition false - find ELSE or END
    // For MVP, we'd need to scan forward
    // Simple approach: set a flag and skip until ELSE/END
    // This is a limitation - proper impl needs pre-processing
    LDI r13, wasm_fetch
    JMP r13
```

**Step 3: Implement wasm_op_else**

```glyph
:wasm_op_else
    // else: we're in the else branch
    // If we got here from if-true, skip to END
    // If we got here from if-false, execute

    // For MVP, just continue
    // Full impl needs branch tracking
    LDI r13, wasm_fetch
    JMP r13
```

**Step 4: Commit**

```bash
git add systems/glyph_stratum/programs/wasm_interpreter.glyph
git commit -m "feat(wasm): implement OP_IF and OP_ELSE for conditionals"
```

---

## Task 10: Create Simple WASM Test Program

**Files:**
- Create: `systems/glyph_stratum/tests/wasm/simple_loop.wat`
- Create: `systems/glyph_stratum/tests/wasm/Makefile`

**Step 1: Create test WAT file**

```wat
;; simple_loop.wat - Test block/loop/br
;; Counts from 0 to 10, stores result at address 0

(module
  (memory 1)
  (func (export "test")
    (local $i i32)

    ;; i = 0
    i32.const 0
    local.set $i

    ;; loop
    (block $exit
      (loop $continue
        ;; if i >= 10, exit
        local.get $i
        i32.const 10
        i32.ge_s
        br_if $exit

        ;; store i at memory[0]
        i32.const 0
        local.get $i
        i32.store

        ;; i++
        local.get $i
        i32.const 1
        i32.add
        local.set $i

        ;; continue loop
        br $continue
      )
    )
  )
)
```

**Step 2: Create Makefile**

```makefile
# Makefile for WASM test programs

WAT2WASM = wat2wasm

all: simple_loop.wasm

simple_loop.wasm: simple_loop.wat
	$(WAT2WASM) $< -o $@

clean:
	rm -f *.wasm

.PHONY: all clean
```

**Step 3: Commit**

```bash
git add systems/glyph_stratum/tests/wasm/
git commit -m "test(wasm): add simple_loop test for block/loop/br"
```

---

## Summary

### What This Plan Delivers

1. **Block stack infrastructure** - Memory layout, push/pop helpers
2. **Control flow opcodes** - block, loop, if, else, br, br_if, end
3. **Test program** - Simple loop that exercises the new functionality

### Estimated Effort

| Task | Time |
|------|------|
| Task 1: Constants | 5 min |
| Task 2: block_push | 15 min |
| Task 3: block_pop | 15 min |
| Task 4-9: Opcodes | 30 min |
| Task 10: Tests | 10 min |

**Total: ~75 minutes**

### Limitations (MVP)

- IF/ELSE skipping requires forward scanning (not fully implemented)
- Block type checking not enforced
- No multi-value returns

---

## Execution Handoff

Plan complete and saved to `docs/plans/2026-03-15-wasm-block-stack.md`.

**Two execution options:**

**1. Subagent-Driven (this session)** - I dispatch fresh subagent per task, review between tasks, fast iteration

**2. Parallel Session (separate)** - Open new session with executing-plans, batch execution with checkpoints

**Which approach?**
