# Texture-Native Abstraction

**How Geometry OS builds abstractions without leaving the GPU.**

This document describes the system where the RAM texture contains its own "standard library" — an atlas of reusable patterns that glyph programs copy from. No Python. No Rust. The texture abstracts itself.

---

## The Problem

After the self-replication proof ([PIXELS_MOVE_PIXELS.md](PIXELS_MOVE_PIXELS.md)), we can copy pixels on the GPU. But every program is still hand-packed as raw u32 values:

```rust
scheduler.poke_substrate_single(0,  glyph(1, 0, 0, 0));   // What does this mean?
scheduler.poke_substrate_single(1,  0);                     // You have to decode it mentally
scheduler.poke_substrate_single(2,  glyph(1, 0, 1, 0));   // This doesn't scale
```

We want to work with *named things* — "LDI r0, 100" — not pixel values. But adding a Python helper to do that is the trap. We need the abstraction to live *in the texture itself*.

---

## Core Concept: The Atlas

The RAM texture is 4096×4096 = 16 million pixels. Programs only use a tiny fraction. We dedicate a region to an **atlas** — a library of pre-built instruction templates that any program can copy from.

```
RAM Texture (16M pixels)
┌──────────────────────────────────────────────────────────┐
│                                                          │
│  EXECUTION SPACE (addresses 0 - 9,999)                   │
│  ├── Your programs live here                             │
│  ├── Self-replicating glyph at 0-17                      │
│  └── New programs get written here                       │
│                                                          │
│  ATLAS (addresses 50,000 - 99,999)                       │
│  ├── Instruction templates                               │
│  ├── Subroutine library                                  │
│  └── Character definitions                               │
│                                                          │
│  SCRATCH SPACE (addresses 100,000+)                      │
│  ├── Text buffers                                        │
│  └── Working memory for assembler                        │
│                                                          │
└──────────────────────────────────────────────────────────┘
```

The atlas is written once during the frozen bootstrap (Rust `poke_substrate_single` calls), then never touched by the CPU again. Programs read from it using LOAD.

---

## What Goes in the Atlas

### 1. Instruction Templates

Each opcode gets a fixed atlas address. A template is the instruction pixel ready to copy:

| Atlas Address | Contents | What It Is |
|---------------|----------|------------|
| 50000 | `(1, 0, 0, 0)` | LDI template (opcode only, register/data filled by caller) |
| 50001 | `(3, 0, 0, 0)` | LOAD template |
| 50002 | `(4, 0, 0, 0)` | STORE template |
| 50003 | `(5, 0, 0, 0)` | ADD template |
| 50004 | `(6, 0, 0, 0)` | SUB template |
| 50005 | `(10, 0, 0, 0)` | BRANCH template |
| 50006 | `(13, 0, 0, 0)` | HALT template |
| 50007 | `(225, 0, 0, 0)` | SPATIAL_SPAWN template |
| ... | ... | ... |

A program that wants to emit "LDI r0, 42" would:
1. LOAD the LDI template from atlas address 50000
2. OR in the register number (p1) and any flags
3. STORE the modified pixel to the output address
4. Write the data pixel (42) to the next address

### 2. Subroutine Library

Pre-built code sequences that programs can copy wholesale:

| Atlas Address | Length | What It Is |
|---------------|--------|------------|
| 51000-51017 | 18 | The self-replication loop (copy N pixels from src to dst) |
| 51100-51110 | 11 | A memset loop (fill N addresses with a constant) |
| 51200-51220 | 21 | The self-spawning replicator |
| 51300-51315 | 16 | A counter loop (increment, compare, branch) |

These are the "functions" of the texture. To use one, a program copies it to its execution space and patches the constants (source address, destination, count).

### 3. Character Bitmaps (for Visual Display)

If we want programs to render text on screen, we need bitmap definitions for each character. Each character is an 8×8 pixel block (64 pixels):

| Atlas Address | What It Is |
|---------------|------------|
| 60000-60063 | 'A' bitmap (8×8 pixels) |
| 60064-60127 | 'B' bitmap |
| 60128-60191 | 'C' bitmap |
| ... | ... |
| 60000 + char×64 | Character `char` bitmap |

A program renders text by: reading a character code → computing atlas offset → copying the 8×8 block to the display region.

### 4. Opcode Lookup Table (for the Assembler)

A mapping from ASCII mnemonic tokens to opcode values:

| Atlas Address | Contents | Meaning |
|---------------|----------|---------|
| 55000 | `(76, 68, 73, 1)` | "LDI" → opcode 1. R=L(76), G=D(68), B=I(73), A=opcode(1) |
| 55001 | `(76, 79, 65, 3)` | "LOA" → opcode 3 (LOAD, first 3 chars) |
| 55002 | `(83, 84, 79, 4)` | "STO" → opcode 4 (STORE) |
| 55003 | `(65, 68, 68, 5)` | "ADD" → opcode 5 |
| 55004 | `(72, 76, 84, 13)` | "HLT" → opcode 13 (HALT) |
| ... | ... | ... |

The assembler program scans this table, matching 3-character tokens from the text buffer to find the correct opcode. The lookup is a linear scan — slow but simple and entirely GPU-native.

---

## The Writer Program

The **writer** is a glyph program that copies from the atlas to a target location. It's a generalization of the self-replication loop:

```
Self-replication:  LOAD from [my address]  → STORE to [destination]
Writer:            LOAD from [atlas addr]  → STORE to [destination]
```

The difference is one register: instead of `r0 = 0` (copy myself), it's `r0 = 50000` (copy from atlas).

### Minimal Writer Program

This program copies 8 pixels from atlas address 50000 to execution address 200:

```
┌──────┬────────────────┬──────────────────────────────────────────┐
│ Addr │ Instruction    │ Meaning                                  │
├──────┼────────────────┼──────────────────────────────────────────┤
│    0 │ LDI r0         │                                          │
│    1 │ DATA: 50000    │ r0 = atlas source address                │
│    2 │ LDI r1         │                                          │
│    3 │ DATA: 200      │ r1 = execution target address            │
│    4 │ LDI r2         │                                          │
│    5 │ DATA: 0        │ r2 = counter                             │
│    6 │ LDI r3         │                                          │
│    7 │ DATA: 1        │ r3 = increment                           │
│    8 │ LDI r4         │                                          │
│    9 │ DATA: 8        │ r4 = number of pixels to copy            │
│   10 │ LOAD r5, [r0]  │ read from atlas                          │
│   11 │ STORE [r1], r5 │ write to execution space                 │
│   12 │ ADD r0 += r3   │ atlas pointer++                          │
│   13 │ ADD r1 += r3   │ target pointer++                         │
│   14 │ ADD r2 += r3   │ counter++                                │
│   15 │ BNE r2, r4     │ if counter != 8, loop                    │
│   16 │ DATA: -7       │ branch offset                            │
│   17 │ HALT           │                                          │
└──────┴────────────────┴──────────────────────────────────────────┘
```

This is identical to the self-replicating program except pixel 1 contains `50000` instead of `0`. Same loop, different source. That's the entire abstraction.

---

## The Assembler Program

The assembler reads ASCII text from a text buffer, looks up opcodes in the atlas, and writes compiled instruction pixels to an output region.

### Input/Output

```
TEXT BUFFER (addr 100000+):  "LDI r0 42\nHLT\n"
   stored as ASCII bytes, one character per pixel R channel

OUTPUT (addr 200+):  (1,0,0,0) (42,0,0,0) (13,0,0,0)
   the compiled program, ready to execute
```

### Algorithm (as a glyph program)

```
1. r0 = text buffer pointer (starts at 100000)
2. r1 = output pointer (starts at 200)
3. LOAD char from [r0]
4. If char == 'L': check next chars for "DI" → emit opcode 1
   If char == 'H': check next chars for "LT" → emit opcode 13
   If char == 'r': parse register number from next char
   If char is digit: parse number, emit as DATA pixel
   If char == '\n': move to next instruction
5. STORE compiled pixel to [r1], advance both pointers
6. Loop until end marker
```

This is complex (~60-80 pixels) but uses only existing opcodes: LOAD, STORE, ADD, BRANCH, AND, OR, SHL. No new GPU features needed.

### Bootstrapping the Assembler

The assembler program itself must be written once by hand (or by the Rust frozen bootstrap). After that, it can assemble *itself* from its own source text. This is the path to self-hosting:

```
Phase 1: Rust pokes the assembler (60 pixels) into the texture      ← frozen bootstrap
Phase 2: Assembler reads text buffer, emits opcode pixels            ← GPU-native
Phase 3: Assembler reads its OWN source from text buffer             ← self-hosting
Phase 4: Delete the Rust bootstrap code                              ← sovereignty
```

---

## Patch-and-Copy Pattern

The most powerful pattern in this system is **patch-and-copy**: load a template, modify one field, write it out.

Example — emitting "LDI r3, 42" using the atlas:

```
LOAD r10 = mem[50000]        ; load LDI template: (1, 0, 0, 0)
LDI  r11 = 0x00030000        ; the p1 field = 3 (register r3), shifted to B position
OR   r10 = r10 | r11         ; patch: (1, 0, 3, 0)
STORE mem[output] = r10      ; write the patched instruction

LDI  r10 = 42                ; the data value
STORE mem[output+1] = r10    ; write the DATA pixel
```

This is 8 instructions to emit a complete LDI. The template provides the opcode, the program patches in the operands. No hardcoded opcode numbers in the program itself — they all come from the atlas.

---

## Implementation Order

### Step 1: Atlas Bootstrap (Rust, one-time)

Write the atlas into the RAM texture during startup. This is a few hundred `poke_substrate_single` calls — the same frozen bootstrap pattern, just more data:

```rust
// Instruction templates at 50000+
scheduler.poke_substrate_single(50000, glyph(1, 0, 0, 0));   // LDI
scheduler.poke_substrate_single(50001, glyph(3, 0, 0, 0));   // LOAD
scheduler.poke_substrate_single(50002, glyph(4, 0, 0, 0));   // STORE
// ...

// Copy loop subroutine at 51000+
for (i, &(_, val)) in self_replicating_program().iter().enumerate() {
    scheduler.poke_substrate_single(51000 + i as u32, val);
}
```

### Step 2: Writer Test

Prove the writer works: a glyph program copies from atlas to execution space.

Test: write a writer program at addr 0 that copies the HALT template from atlas addr 50006 to execution addr 200. After execution, `peek_substrate_single(200)` should return `glyph(13, 0, 0, 0)`.

### Step 3: Patch-and-Copy Test

Prove patching works: a glyph program loads a template, ORs in operands, writes the result.

Test: program loads LDI template, patches in register 3 and value 42, writes to addr 200-201. After execution, addr 200 = `(1, 0, 3, 0)` and addr 201 = `42`.

### Step 4: Minimal Assembler

A glyph program that reads 3 ASCII characters from a text buffer, matches them against the opcode lookup table, and emits the corresponding instruction pixel.

Test: write "HLT" (72, 76, 84) to text buffer at addr 100000. Run assembler. After execution, addr 200 = `glyph(13, 0, 0, 0)`.

### Step 5: Full Assembler

Extend to handle registers, immediates, and multi-instruction programs.

Test: write "LDI r0 5\nHLT\n" to text buffer. After execution, addr 200-202 = a working program.

### Step 6: Self-Assembly

The assembler reads its own source text and produces its own binary. Delete the Rust bootstrap.

---

## Why This Works

The self-replication proof showed that LOAD + STORE + loop = arbitrary copying on the GPU. The atlas is just the data source. The abstraction isn't in Python or Rust — it's pixels at known addresses that programs can read.

This is how early computers worked. The "standard library" was a card deck. The "linker" was a human feeding cards into the reader. Here, the card deck is the atlas region of the texture, the linker is a LOAD instruction, and the reader is the Hilbert curve.

The difference: everything happens at GPU speed, in parallel, with spatial locality preserved by the Hilbert mapping. Programs that use nearby atlas entries cluster together visually on the texture. You can literally see the dependency structure.

---

## Relationship to the Glyph Font

In Geometry OS, the font *is* the CPU. The atlas described here is literally a font — a set of reusable visual definitions that programs reference by address. When we say "the font is the CPU," we mean:

- The atlas contains executable patterns (instruction templates, subroutines)
- Programs reference them by address (like font glyphs by codepoint)
- The GPU renders them by copying them into execution space (like rendering text by copying glyph bitmaps)

The only difference between a font and an executable library is whether the pattern is meant to be *displayed* or *executed*. In Geometry OS, there is no difference. The screen is the hard drive. The font is the CPU. The atlas is both.

---

## Files

| File | Purpose |
|------|---------|
| `docs/PIXELS_MOVE_PIXELS.md` | The self-replication proof (prerequisite) |
| `docs/TEXTURE_NATIVE_ABSTRACTION.md` | This document |
| `systems/infinite_map_rs/tests/self_replication_test.rs` | Working proof of LOAD/STORE/loop |
| `conductor/glyph-assembler-plan.md` | Assembler implementation plan |
