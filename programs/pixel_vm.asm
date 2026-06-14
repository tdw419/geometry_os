; pixel_vm.asm -- A VM that runs inside the VM, with all state visible as pixels.
;
; Architecture:
;   A "pixel program" is an array of u32 values stored in screen memory.
;   Each u32 encodes one pixel-instruction:
;     Bits 31-24 (R): opcode
;     Bits 23-16 (G): operand1
;     Bits 15-8  (B): operand2
;     Bits  7-0  (A): unused
;
;   Pixel-ISA opcodes:
;     0x01 LOADI  reg, imm   -- pv_regs[reg] = imm
;     0x02 ADD    dest, src  -- pv_regs[dest] += pv_regs[src]
;     0x03 SUB    dest, src  -- pv_regs[dest] -= pv_regs[src]
;     0x04 MUL    dest, src  -- pv_regs[dest] *= pv_regs[src]
;     0x05 STORE  reg, addr  -- pv_data[addr] = pv_regs[reg]
;     0x06 LOAD   reg, addr  -- pv_regs[reg] = pv_data[addr]
;     0x07 CMPI   reg, imm   -- flag = (pv_regs[reg] == imm) ? 0 : 1
;     0x08 JNZ    addr       -- if flag != 0, pv_pc = addr
;     0xFF HALT               -- stop execution
;
; Screen memory layout (offset from SCREEN_RAM_BASE = 0x10000):
;   0x0000..0x00FF  pixel program (256 instructions)
;   0x0100..0x01FF  pixel-VM registers (16 registers, visible as pixels)
;   0x0200..0x02FF  pixel-VM data memory (256 words, visible)
;
; The pixel-VM is itself a GeOS assembly program. It reads pixel-instructions
; from screen[], decodes channels, executes, and writes register/data state
; back to screen[] so every state change is visible.
;
; GeOS register allocation:
;   r0  = GeOS zero/flag (CMP sets this)
;   r1  = pixel-VM PC (instruction index)
;   r2  = fetched pixel-instruction (raw u32)
;   r3  = decoded opcode (R channel, bits 31-24)
;   r4  = decoded operand1 (G channel, bits 23-16)
;   r5  = decoded operand2 (B channel, bits 15-8)
;   r6  = base address of pixel program in screen (0x10000)
;   r7  = base address of pixel registers in screen (0x10100)
;   r8  = base address of pixel data memory in screen (0x10200)
;   r9  = pixel-VM flag register (0=equal, 1=not-equal from CMPI)
;   r10-r15 = temp

; ── Constants ──────────────────────────────────────────────
#define SCREEN_BASE     0x10000
#define PV_PROG_BASE    0x10000
#define PV_REG_BASE     0x10100
#define PV_DATA_BASE    0x10200
#define MAX_INSTRUCTIONS 256

; ── Pixel-ISA opcodes ──────────────────────────────────────
#define PV_LOADI 0x01
#define PV_ADD   0x02
#define PV_SUB   0x03
#define PV_MUL   0x04
#define PV_STORE 0x05
#define PV_LOAD  0x06
#define PV_CMPI  0x07
#define PV_JNZ   0x08
#define PV_HALT  0xFF

; ── Main ───────────────────────────────────────────────────
    LDI r30, 0xFD00
    LDI r6, PV_PROG_BASE
    LDI r7, PV_REG_BASE
    LDI r8, PV_DATA_BASE
    LDI r1, 0              ; pixel-VM PC = 0
    LDI r9, 0              ; pixel-VM flag = 0

pv_loop:
    ; ── Fetch: screen[PV_PROG_BASE + PC] ──
    MOV r10, r6
    ADD r10, r1            ; r10 = PV_PROG_BASE + PC
    LOAD r2, r10           ; r2 = pixel-instruction u32

    ; ── Decode R channel (opcode): (r2 >> 24) & 0xFF ──
    LDI r14, 24
    MOV r3, r2
    SHR r3, r14
    ANDI r3, 0xFF

    ; ── Decode G channel (operand1): (r2 >> 16) & 0xFF ──
    LDI r14, 16
    MOV r4, r2
    SHR r4, r14
    ANDI r4, 0xFF

    ; ── Decode B channel (operand2): (r2 >> 8) & 0xFF ──
    LDI r14, 8
    MOV r5, r2
    SHR r5, r14
    ANDI r5, 0xFF

    ; ── Dispatch on opcode ──
    CMPI r3, PV_HALT
    CMPI r0, 0
    JZ r0, pv_halt

    CMPI r3, PV_LOADI
    CMPI r0, 0
    JZ r0, pv_op_loadi

    CMPI r3, PV_ADD
    CMPI r0, 0
    JZ r0, pv_op_add

    CMPI r3, PV_SUB
    CMPI r0, 0
    JZ r0, pv_op_sub

    CMPI r3, PV_MUL
    CMPI r0, 0
    JZ r0, pv_op_mul

    CMPI r3, PV_STORE
    CMPI r0, 0
    JZ r0, pv_op_store

    CMPI r3, PV_LOAD
    CMPI r0, 0
    JZ r0, pv_op_load

    CMPI r3, PV_CMPI
    CMPI r0, 0
    JZ r0, pv_op_cmpi

    CMPI r3, PV_JNZ
    CMPI r0, 0
    JZ r0, pv_op_jnz

    ; Unknown opcode -- skip
    JMP pv_next

; ── LOADI reg, imm: pv_regs[operand1] = operand2 ──────────
pv_op_loadi:
    MOV r10, r7
    ADD r10, r4            ; r10 = PV_REG_BASE + reg
    STORE r10, r5          ; screen[PV_REG_BASE + reg] = imm
    JMP pv_next

; ── ADD dest, src: pv_regs[dest] += pv_regs[src] ─────────
pv_op_add:
    MOV r10, r7
    ADD r10, r4            ; addr of pv_regs[dest]
    LOAD r12, r10          ; r12 = pv_regs[dest]
    MOV r11, r7
    ADD r11, r5            ; addr of pv_regs[src]
    LOAD r13, r11          ; r13 = pv_regs[src]
    ADD r12, r13
    STORE r10, r12         ; pv_regs[dest] = result
    JMP pv_next

; ── SUB dest, src ─────────────────────────────────────────
pv_op_sub:
    MOV r10, r7
    ADD r10, r4
    LOAD r12, r10
    MOV r11, r7
    ADD r11, r5
    LOAD r13, r11
    SUB r12, r13
    STORE r10, r12
    JMP pv_next

; ── MUL dest, src ─────────────────────────────────────────
pv_op_mul:
    MOV r10, r7
    ADD r10, r4
    LOAD r12, r10
    MOV r11, r7
    ADD r11, r5
    LOAD r13, r11
    MUL r12, r13
    STORE r10, r12
    JMP pv_next

; ── STORE reg, addr: pv_data[operand2] = pv_regs[operand1] ─
pv_op_store:
    MOV r10, r7
    ADD r10, r4            ; addr of pv_regs[reg]
    LOAD r12, r10          ; r12 = pv_regs[reg]
    MOV r11, r8
    ADD r11, r5            ; addr of pv_data[addr]
    STORE r11, r12         ; pv_data[addr] = pv_regs[reg]
    JMP pv_next

; ── LOAD reg, addr: pv_regs[operand1] = pv_data[operand2] ─
pv_op_load:
    MOV r10, r8
    ADD r10, r5            ; addr of pv_data[addr]
    LOAD r12, r10          ; r12 = pv_data[addr]
    MOV r11, r7
    ADD r11, r4            ; addr of pv_regs[reg]
    STORE r11, r12         ; pv_regs[reg] = pv_data[addr]
    JMP pv_next

; ── CMPI reg, imm: flag = (pv_regs[reg] == imm) ? 0 : 1 ─
pv_op_cmpi:
    MOV r10, r7
    ADD r10, r4            ; addr of pv_regs[reg]
    LOAD r12, r10          ; r12 = pv_regs[reg]
    ; Compare r12 with operand2 (r5)
    ; GeOS CMP sets r0: 0=equal, 1=less, 2=greater
    CMP r12, r5
    ; If r0 == 0, values are equal -> pixel flag = 0
    ; If r0 != 0, values differ -> pixel flag = 1
    CMPI r0, 0
    CMPI r0, 0              ; double-negation: r0 was 0 means equal
    JZ r0, pv_cmpi_eq
    LDI r9, 1              ; flag = 1 (not equal)
    JMP pv_next
pv_cmpi_eq:
    LDI r9, 0              ; flag = 0 (equal)
    JMP pv_next

; ── JNZ addr: if flag != 0, PC = operand2 ─────────────────
pv_op_jnz:
    CMPI r9, 0             ; is pixel flag zero?
    CMPI r0, 0              ; r0=0 means flag was 0
    JZ r0, pv_next         ; flag is 0, don't jump
    MOV r1, r5             ; PC = operand2
    JMP pv_loop            ; fetch from new PC (skip PC++)

; ── Next instruction ──────────────────────────────────────
pv_next:
    ADDI r1, 1             ; PC++
    JMP pv_loop

pv_halt:
    HALT
