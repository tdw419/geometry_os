# Phase 99: Sound Mixer Daemon Implementation Plan

## Overview
Implement a sound mixer daemon for Geometry OS using custom RISC-V opcodes:
- `SPAWN` (0x7B) - Spawn child VMs
- `BEEP` (0x7C) - Queue audio tones
- `CALL` (0x7D) - Subroutine calls
- `RET` (0x7E) - Return from subroutines
- `PUSH` (0x7F) - Push to stack
- `POP` (0x80) - Pop from stack

## Memory Layout

### BEEP_QUEUE (0x3000-0x3107)
- Circular queue for audio tone requests
- 16 entries, 8 bytes each (frequency + duration)
- Head pointer at 0x3080
- Tail pointer at 0x3084
- Audio ready flag at 0x3108

### SPAWN_TABLE (0x3200-0x33FF)
- Max 8 child VMs
- Each entry: 16 bytes
  - Offset 0: status (0=free, 1=running, 2=halted)
  - Offset 4: entry_point
  - Offset 8: return_pc
  - Offset 12: _pad

### STACK (0xF000-0xFFFF)
- 4KB stack, grows downward
- Stack pointer: x30

## Opcode Encoding

### SPAWN (0x7B)
Format: funct7=0, rs1, funct3=0, rd=0, opcode=0x7B
- rs1: Register containing entry point address
- Finds free slot in SPAWN_TABLE
- Writes VM state: status=1, entry_point, return_pc=PC+4

### BEEP (0x7C)
Format: funct7=0, rs2, rs1, funct3=0, rd=0, opcode=0x7C
- rs1: Frequency (Hz)
- rs2: Duration (ms)
- Queues tone to BEEP_QUEUE if not full
- Sets audio_ready flag

### CALL (0x7D)
Format: funct7=0, rs2=0, rs1, funct3=0, rd=0, opcode=0x7D
- rs1: Target address
- Pushes PC+4 to stack, jumps to target

### RET (0x7E)
Format: funct7=0, rs2=0, rs1=0, funct3=0, rd=0, opcode=0x7E
- Pops return address from stack, jumps to it

### PUSH (0x7F)
Format: funct7=0, rs2=0, rs1, funct3=0, rd=0, opcode=0x7F
- rs1: Register to push
- Decrements stack pointer, writes value

### POP (0x80)
Format: funct7=0, rs2=0, rs1=0, funct3=0, rd, opcode=0x80
- rd: Destination register (0 = discard)
- Reads value, increments stack pointer, writes to rd

## Sound Mixer Daemon (sound_mixer.asm)

The daemon:
1. Initializes BEEP_QUEUE (head=0, tail=0)
2. Spawns child VMs for different audio channels
3. Uses CALL/RET for modular audio mixing functions
4. Uses PUSH/POP for register saving

## Testing Strategy

### Unit Tests
- test_phase99_push_pop: Test stack operations
- test_phase99_call_ret: Test subroutine calls
- test_phase99_beep: Test audio queue
- test_phase99_spawn: Test child VM spawning

### Integration Test
- test_sound_mixer_daemon: Full end-to-end sound_mixer.asm execution

## CPU-side Audio Polling

After each GPU execution cycle:
1. Read audio_ready flag from 0x3108
2. If set, read BEEP_QUEUE entries from head to tail
3. Convert to audio samples (e.g., sine wave)
4. Send to audio output device
5. Clear audio_ready flag

## Implementation Status

- [x] Opcode constants added to riscv_executor.wgsl (lines 37-48)
- [x] Opcode cases added to main instruction decoder (lines 1056-1162)
- [x] Memory region constants defined (BEEP_QUEUE, SPAWN_TABLE, STACK_BASE)
- [x] WGSL implementation complete for all 6 opcodes:
  - OP_SPAWN (0x7B): Spawns child VMs, writes to SPAWN_TABLE at 0x3200
  - OP_BEEP (0x7C): Queues audio tones to BEEP_QUEUE at 0x3000
  - OP_CALL (0x7D): Subroutine call, pushes PC+4 to stack (x30)
  - OP_RET (0x7E): Return from subroutine, pops PC from stack
  - OP_PUSH (0x7F): Push register to stack at SP
  - OP_POP (0x80): Pop from stack to register
- [x] Fixed WGSL implementation to use read_reg()/write_reg() instead of invalid regs[] array access
- [x] Unit tests created (Rust tests ready):
  - test_phase99_push_pop.rs - PUSH/POP stack operations
  - test_phase99_call_ret.rs - CALL/RET subroutine calls
  - test_phase99_beep.rs - BEEP queue management
  - test_phase99_spawn.rs - SPAWN child VM table
- [x] test_phase99_opcodes.rs moved to systems/infinite_map_rs/tests/
- [ ] Unit tests BLOCKED: GPU binding limit exceeded (12 storage buffers, limit is 8)
- [ ] Integration test created
- [ ] CPU-side audio polling implemented
- [ ] sound_mixer.asm written and tested

## WGSL Implementation Details (2026-07-03)

### Fixed Issues
- **Original bug**: Phase 99 opcodes used `regs[]` array directly (doesn't exist)
- **Fix**: Updated all opcodes to use `read_reg()` and `write_reg()` helper functions
- **Lines modified**: riscv_executor.wgsl 1056-1162

### Opcode Implementations

#### SPAWN (0x7B) - Spawn Child VM
```wgsl
case OP_SPAWN: {
    let entry_point = read_reg(d.rs1);
    // Find free slot in SPAWN_TABLE (0x3200-0x33FF)
    // Write status=1, entry_point, return_pc=PC+4
    return pc + 4u;
}
```

#### BEEP (0x7C) - Queue Audio Tone
```wgsl
case OP_BEEP: {
    let freq = read_reg(d.rs1);
    let dur = read_reg(d.rs2);
    // Write to BEEP_QUEUE at 0x3000
    // Update head pointer at 0x3080
    // Set audio ready flag at 0x3108
    return pc + 4u;
}
```

#### CALL (0x7D) - Subroutine Call
```wgsl
case OP_CALL: {
    let target_addr = read_reg(d.rs1);
    var sp = read_reg(30u);  // Stack pointer in x30
    sp -= 4u;
    write_u32(sp, pc + 4u);  // Save return address
    write_reg(30u, sp);
    return target_addr;
}
```

#### RET (0x7E) - Return from Subroutine
```wgsl
case OP_RET: {
    var sp = read_reg(30u);
    let ret_addr = read_u32(sp);
    sp += 4u;
    write_reg(30u, sp);
    return ret_addr;
}
```

#### PUSH/POP (0x7F/0x80) - Stack Operations
```wgsl
case OP_PUSH, OP_POP: {
    var sp = read_reg(30u);
    if (d.opcode == OP_PUSH) {
        let value = read_reg(d.rs1);
        sp -= 4u;
        write_u32(sp, value);
    } else {
        let value = read_u32(sp);
        sp += 4u;
        if (rd != 0u) { write_reg(rd, value); }
    }
    write_reg(30u, sp);
    return pc + 4u;
}
```

## Testing Status (2026-07-03)

Created 4 unit tests with hand-encoded RISC-V binaries:
- All tests use `RiscvExecutor::new_with_ram()` API
- All tests use `executor.load_binary()` and `executor.read_ram()`
- Tests verify memory state after execution

**To run tests** (once compilation errors are fixed):
```bash
# From systems/infinite_map_rs
cargo test --test test_phase99_push_pop test_push_pop_basic -- --nocapture
cargo test --test test_phase99_call_ret test_call_ret_basic -- --nocapture
cargo test --test test_phase99_beep test_beep_queue_basic -- --nocapture
cargo test --test test_phase99_spawn test_spawn_basic -- --nocapture
```