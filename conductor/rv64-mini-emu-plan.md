# Implementation Plan: RISC-V Mini Emulator (RV64I Subset)

## Sub-Tasks

1. **[TASK-1] Scaffold Main VM Loop (Fetch)**
   - Define `GUEST_RAM`, `GUEST_REGS`, `UART_BASE`.
   - Implement `FETCH` routine to read 32-bit RISC-V instruction into `r13`.
   - Implement `r10` (Guest PC) increment logic.

2. **[TASK-2] Implement Dispatcher (Decode)**
   - Implement bitwise extraction for opcode (bits 0-6).
   - Implement `JZ` based dispatch table for `0x37`, `0x13`, `0x23`, `0x73`.

3. **[TASK-3] Implement Instruction Handlers**
   - `LUI_HANDLER`: Extract `rd`, `imm`, update `GUEST_REGS[rd]`.
   - `ADDI_HANDLER`: Extract `rd`, `rs1`, `imm`, update `GUEST_REGS[rd] = GUEST_REGS[rs1] + imm`.
   - `SW_HANDLER`: Extract `rs1`, `rs2`, `imm`, write `GUEST_REGS[rs2]` to `GUEST_REGS[rs1] + imm`.
   - `EBREAK_HANDLER`: Halt the substrate loop.

4. **[TASK-4] Verification & Bootstrapping**
   - Load the "GEOM" test program into `GUEST_RAM`.
   - Execute the VM loop.
   - Verify UART output at substrate address `0x200`.

## Strategy
- Use **Sovereignty Chain** to assemble the `.glyph` emulator.
- Use **Synthetic VRAM** to simulate the environment before hardware deployment.
- Leverage **Hilbert Coherence** to ensure spatial locality of guest memory regions.

## Success Criteria
- Substrate console outputs "GEOM".
- Guest PC increments correctly across instructions.
- All guest register values match expected results in spatial memory.
