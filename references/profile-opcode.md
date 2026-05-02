# PROFILE Opcode (0xC6)

## Overview

Performance profiling opcode that measures instruction counts per code region. Programs can wrap code sections with MARK start/stop, then read back accumulated counts to identify hot loops.

## Encoding

```
PROFILE mode_reg, data_reg    ; 3 words: [0xC6, mode_r, data_r]
```

Both arguments are **registers** (not immediates). `mode_reg` selects the operation, `data_reg` provides the region ID or base address depending on mode.

## Modes

### Mode 0: MARK (toggle start/stop)
```
LDI r1, 0          ; mode = MARK
LDI r2, 0          ; region_id = 0 (0-15)
PROFILE r1, r2     ; start region 0

; ... code to profile ...

PROFILE r1, r2     ; stop region 0, accumulate delta
```

First MARK on a region starts timing (records `total_steps`). Second MARK stops timing and adds the delta to the region's accumulated count. Toggle behavior -- pairs of MARK calls.

### Mode 1: READ (get count)
```
LDI r1, 1          ; mode = READ
LDI r2, 0          ; region_id = 0
PROFILE r1, r2     ; r0 = accumulated count for region 0
```

Returns the accumulated count in `r0` (low 32 bits). If the region is currently active (MARK started but not stopped), includes the running delta.

### Mode 2: RESET (clear all)
```
LDI r1, 2          ; mode = RESET
LDI r2, 0          ; data_reg ignored
PROFILE r1, r2     ; clear all 16 regions
```

Clears all profile regions, active flags, and start steps.

### Mode 3: DUMP (write to RAM)
```
LDI r1, 3          ; mode = DUMP
LDI r2, 0x3000     ; base RAM address
PROFILE r1, r2     ; write entries to RAM, r0 = entry count
```

Writes non-zero/active regions to RAM starting at `data_reg` address. Each entry is 3 words:
- `[region_id, count_lo, count_hi]`

Returns number of entries written in `r0`.

## VM State Fields

```rust
pub total_steps: u64,           // incremented every step() call
pub profile_regions: [u64; 16], // accumulated counts per region
pub profile_active: [bool; 16], // true when MARK-start pending
pub profile_start: [u64; 16],   // total_steps when each region was MARK-started
```

## Limitations

- 16 regions max (region_id 0-15)
- Counts are u64 but READ returns low 32 bits in r0
- DUMP writes count as [lo, hi] pair (3 words per entry)
- No per-process isolation -- regions are global to the VM
- `total_steps` counts all instructions across all processes (not per-process)

## Example: Profile a hot loop

```asm
; Profile two code regions and print results
LDI r1, 0          ; mode = MARK
LDI r2, 0          ; region 0
PROFILE r1, r2     ; start region 0

; Region 0: simple loop
LDI r10, 0
loop0:
  ADD r10, r10
  CMP r10, r5      ; r5 = limit
  BLT r0, loop0

LDI r2, 0
PROFILE r1, r2     ; stop region 0

; Region 1: nested loop (more expensive)
LDI r2, 1
PROFILE r1, r2     ; start region 1

LDI r10, 0
loop1y:
  LDI r11, 0
  loop1x:
    ADD r11, r11
    CMP r11, r5
    BLT r0, loop1x
  ADD r10, r10
  CMP r10, r5
  BLT r0, loop1y

LDI r2, 1
PROFILE r1, r2     ; stop region 1

; Read results
LDI r2, 0
LDI r1, 1
PROFILE r1, r2     ; r0 = region 0 count
; r0 has the count -- use TEXT to display it
HALT
```

## Implementation Sites

- **VM handler**: `src/vm/mod.rs` ~line 3893 (opcode 0xC6 match arm)
- **Assembler**: `src/assembler/system_ops.rs` ~line 1149
- **Disassembler**: `src/vm/disasm.rs` ~line 981
- **Preprocessor**: `src/preprocessor.rs` (OPCODES array)
- **Tests**: `src/vm/tests.rs` ~line 24582 (8 tests)

## Word Count Pitfall (historical)

The assembler originally encoded PROFILE as 4 words `[0xC6, 0, mode_r, data_r]` but the VM handler reads 3 words `[0xC6, mode_r, data_r]`. This was fixed -- the assembler now correctly produces 3 words. If PROFILE causes misaligned instructions, verify the assembler output matches `[0xC6, mode_r, data_r]`.
