; DESCRIPTION: Geometry OS program to draw a colored object.

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
;   r13  = GeOS zero/flag (CMP sets this)
;   r14  = pixel-VM PC (instruction index)
;   r4  = fetched pixel-instruction (raw u32)
;   r7  = decoded opcode (R channel, bits 31-24)
;   r1  = decoded operand1 (G channel, bits 23-16)
;   r15  = decoded operand2 (B channel, bits 15-8)
;   r3  = base address of pixel program in screen (0x10000)
;   r2  = base address of pixel registers in screen (0x10100)
;   r11  = base address of pixel data memory in screen (0x10200)
;   r10  = pixel-VM flag register (0=equal, 1=not-equal from CMPI)
;   r9-r5 = temp

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
    LDI r3, PV_PROG_BASE
    LDI r2, PV_REG_BASE
    LDI r11, PV_DATA_BASE
    LDI r14, 0              ; pixel-VM PC = 0
    LDI r10, 0              ; pixel-VM flag = 0

pv_loop:
    ; ── Fetch: screen[PV_PROG_BASE + PC] ──
    MOV r9, r3
    ADD r9, r14            ; r9 = PV_PROG_BASE + PC
    LOAD r4, r9           ; r4 = pixel-instruction u32

    ; ── Decode R channel (opcode): (r4 >> 24) & 0xFF ──
    LDI r8, 24
    MOV r7, r4
    SHR r7, r8
    ANDI r7, 0xFF

    ; ── Decode G channel (operand1): (r4 >> 16) & 0xFF ──
    LDI r8, 16
    MOV r1, r4
    SHR r1, r8
    ANDI r1, 0xFF

    ; ── Decode B channel (operand2): (r4 >> 8) & 0xFF ──
    LDI r8, 8
    MOV r15, r4
    SHR r15, r8
    ANDI r15, 0xFF

    ; ── Dispatch on opcode ──
    CMPI r7, PV_HALT
    CMPI r13, 0
    JZ r13, pv_halt

    CMPI r7, PV_LOADI
    CMPI r13, 0
    JZ r13, pv_op_loadi

    CMPI r7, PV_ADD
    CMPI r13, 0
    JZ r13, pv_op_add

    CMPI r7, PV_SUB
    CMPI r13, 0
    JZ r13, pv_op_sub

    CMPI r7, PV_MUL
    CMPI r13, 0
    JZ r13, pv_op_mul

    CMPI r7, PV_STORE
    CMPI r13, 0
    JZ r13, pv_op_store

    CMPI r7, PV_LOAD
    CMPI r13, 0
    JZ r13, pv_op_load

    CMPI r7, PV_CMPI
    CMPI r13, 0
    JZ r13, pv_op_cmpi

    CMPI r7, PV_JNZ
    CMPI r13, 0
    JZ r13, pv_op_jnz

    ; Unknown opcode -- skip
    JMP pv_next

; ── LOADI reg, imm: pv_regs[operand1] = operand2 ──────────
pv_op_loadi:
    MOV r9, r2
    ADD r9, r1            ; r9 = PV_REG_BASE + reg
    STORE r9, r15          ; screen[PV_REG_BASE + reg] = imm
    JMP pv_next

; ── ADD dest, src: pv_regs[dest] += pv_regs[src] ─────────
pv_op_add:
    MOV r9, r2
    ADD r9, r1            ; addr of pv_regs[dest]
    LOAD r0, r9          ; r0 = pv_regs[dest]
    MOV r12, r2
    ADD r12, r15            ; addr of pv_regs[src]
    LOAD r6, r12          ; r6 = pv_regs[src]
    ADD r0, r6
    STORE r9, r0         ; pv_regs[dest] = result
    JMP pv_next

; ── SUB dest, src ─────────────────────────────────────────
pv_op_sub:
    MOV r9, r2
    ADD r9, r1
    LOAD r0, r9
    MOV r12, r2
    ADD r12, r15
    LOAD r6, r12
    SUB r0, r6
    STORE r9, r0
    JMP pv_next

; ── MUL dest, src ─────────────────────────────────────────
pv_op_mul:
    MOV r9, r2
    ADD r9, r1
    LOAD r0, r9
    MOV r12, r2
    ADD r12, r15
    LOAD r6, r12
    MUL r0, r6
    STORE r9, r0
    JMP pv_next

; ── STORE reg, addr: pv_data[operand2] = pv_regs[operand1] ─
pv_op_store:
    MOV r9, r2
    ADD r9, r1            ; addr of pv_regs[reg]
    LOAD r0, r9          ; r0 = pv_regs[reg]
    MOV r12, r11
    ADD r12, r15            ; addr of pv_data[addr]
    STORE r12, r0         ; pv_data[addr] = pv_regs[reg]
    JMP pv_next

; ── LOAD reg, addr: pv_regs[operand1] = pv_data[operand2] ─
pv_op_load:
    MOV r9, r11
    ADD r9, r15            ; addr of pv_data[addr]
    LOAD r0, r9          ; r0 = pv_data[addr]
    MOV r12, r2
    ADD r12, r1            ; addr of pv_regs[reg]
    STORE r12, r0         ; pv_regs[reg] = pv_data[addr]
    JMP pv_next

; ── CMPI reg, imm: flag = (pv_regs[reg] == imm) ? 0 : 1 ─
pv_op_cmpi:
    MOV r9, r2
    ADD r9, r1            ; addr of pv_regs[reg]
    LOAD r0, r9          ; r0 = pv_regs[reg]
    ; Compare r0 with operand2 (r15)
    ; GeOS CMP sets r13: 0=equal, 1=less, 2=greater
    CMP r0, r15
    ; If r13 == 0, values are equal -> pixel flag = 0
    ; If r13 != 0, values differ -> pixel flag = 1
    CMPI r13, 0
    CMPI r13, 0              ; double-negation: r13 was 0 means equal
    JZ r13, pv_cmpi_eq
    LDI r10, 1              ; flag = 1 (not equal)
    JMP pv_next
pv_cmpi_eq:
    LDI r10, 0              ; flag = 0 (equal)
    JMP pv_next

; ── JNZ addr: if flag != 0, PC = operand2 ─────────────────
pv_op_jnz:
    CMPI r10, 0             ; is pixel flag zero?
    CMPI r13, 0              ; r13=0 means flag was 0
    JZ r13, pv_next         ; flag is 0, don't jump
    MOV r14, r15             ; PC = operand2
    JMP pv_loop            ; fetch from new PC (skip PC++)

; ── Next instruction ──────────────────────────────────────
pv_next:
    ADDI r14, 1             ; PC++
    JMP pv_loop

pv_halt:
    HALT
