; DESCRIPTION: Draws a colored object at the screen with fixed size.

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
;   r2  = GeOS zero/flag (CMP sets this)
;   r14  = pixel-VM PC (instruction index)
;   r11  = fetched pixel-instruction (raw u32)
;   r13  = decoded opcode (R channel, bits 31-24)
;   r5  = decoded operand1 (G channel, bits 23-16)
;   r3  = decoded operand2 (B channel, bits 15-8)
;   r4  = base address of pixel program in screen (0x10000)
;   r6  = base address of pixel registers in screen (0x10100)
;   r7  = base address of pixel data memory in screen (0x10200)
;   r15  = pixel-VM flag register (0=equal, 1=not-equal from CMPI)
;   r9-r10 = temp

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
    LDI r4, PV_PROG_BASE
    LDI r6, PV_REG_BASE
    LDI r7, PV_DATA_BASE
    LDI r14, 0              ; pixel-VM PC = 0
    LDI r15, 0              ; pixel-VM flag = 0

pv_loop:
    ; ── Fetch: screen[PV_PROG_BASE + PC] ──
    MOV r9, r4
    ADD r9, r14            ; r9 = PV_PROG_BASE + PC
    LOAD r11, r9           ; r11 = pixel-instruction u32

    ; ── Decode R channel (opcode): (r11 >> 24) & 0xFF ──
    LDI r1, 24
    MOV r13, r11
    SHR r13, r1
    ANDI r13, 0xFF

    ; ── Decode G channel (operand1): (r11 >> 16) & 0xFF ──
    LDI r1, 16
    MOV r5, r11
    SHR r5, r1
    ANDI r5, 0xFF

    ; ── Decode B channel (operand2): (r11 >> 8) & 0xFF ──
    LDI r1, 8
    MOV r3, r11
    SHR r3, r1
    ANDI r3, 0xFF

    ; ── Dispatch on opcode ──
    CMPI r13, PV_HALT
    CMPI r2, 0
    JZ r2, pv_halt

    CMPI r13, PV_LOADI
    CMPI r2, 0
    JZ r2, pv_op_loadi

    CMPI r13, PV_ADD
    CMPI r2, 0
    JZ r2, pv_op_add

    CMPI r13, PV_SUB
    CMPI r2, 0
    JZ r2, pv_op_sub

    CMPI r13, PV_MUL
    CMPI r2, 0
    JZ r2, pv_op_mul

    CMPI r13, PV_STORE
    CMPI r2, 0
    JZ r2, pv_op_store

    CMPI r13, PV_LOAD
    CMPI r2, 0
    JZ r2, pv_op_load

    CMPI r13, PV_CMPI
    CMPI r2, 0
    JZ r2, pv_op_cmpi

    CMPI r13, PV_JNZ
    CMPI r2, 0
    JZ r2, pv_op_jnz

    ; Unknown opcode -- skip
    JMP pv_next

; ── LOADI reg, imm: pv_regs[operand1] = operand2 ──────────
pv_op_loadi:
    MOV r9, r6
    ADD r9, r5            ; r9 = PV_REG_BASE + reg
    STORE r9, r3          ; screen[PV_REG_BASE + reg] = imm
    JMP pv_next

; ── ADD dest, src: pv_regs[dest] += pv_regs[src] ─────────
pv_op_add:
    MOV r9, r6
    ADD r9, r5            ; addr of pv_regs[dest]
    LOAD r12, r9          ; r12 = pv_regs[dest]
    MOV r8, r6
    ADD r8, r3            ; addr of pv_regs[src]
    LOAD r0, r8          ; r0 = pv_regs[src]
    ADD r12, r0
    STORE r9, r12         ; pv_regs[dest] = result
    JMP pv_next

; ── SUB dest, src ─────────────────────────────────────────
pv_op_sub:
    MOV r9, r6
    ADD r9, r5
    LOAD r12, r9
    MOV r8, r6
    ADD r8, r3
    LOAD r0, r8
    SUB r12, r0
    STORE r9, r12
    JMP pv_next

; ── MUL dest, src ─────────────────────────────────────────
pv_op_mul:
    MOV r9, r6
    ADD r9, r5
    LOAD r12, r9
    MOV r8, r6
    ADD r8, r3
    LOAD r0, r8
    MUL r12, r0
    STORE r9, r12
    JMP pv_next

; ── STORE reg, addr: pv_data[operand2] = pv_regs[operand1] ─
pv_op_store:
    MOV r9, r6
    ADD r9, r5            ; addr of pv_regs[reg]
    LOAD r12, r9          ; r12 = pv_regs[reg]
    MOV r8, r7
    ADD r8, r3            ; addr of pv_data[addr]
    STORE r8, r12         ; pv_data[addr] = pv_regs[reg]
    JMP pv_next

; ── LOAD reg, addr: pv_regs[operand1] = pv_data[operand2] ─
pv_op_load:
    MOV r9, r7
    ADD r9, r3            ; addr of pv_data[addr]
    LOAD r12, r9          ; r12 = pv_data[addr]
    MOV r8, r6
    ADD r8, r5            ; addr of pv_regs[reg]
    STORE r8, r12         ; pv_regs[reg] = pv_data[addr]
    JMP pv_next

; ── CMPI reg, imm: flag = (pv_regs[reg] == imm) ? 0 : 1 ─
pv_op_cmpi:
    MOV r9, r6
    ADD r9, r5            ; addr of pv_regs[reg]
    LOAD r12, r9          ; r12 = pv_regs[reg]
    ; Compare r12 with operand2 (r3)
    ; GeOS CMP sets r2: 0=equal, 1=less, 2=greater
    CMP r12, r3
    ; If r2 == 0, values are equal -> pixel flag = 0
    ; If r2 != 0, values differ -> pixel flag = 1
    CMPI r2, 0
    CMPI r2, 0              ; double-negation: r2 was 0 means equal
    JZ r2, pv_cmpi_eq
    LDI r15, 1              ; flag = 1 (not equal)
    JMP pv_next
pv_cmpi_eq:
    LDI r15, 0              ; flag = 0 (equal)
    JMP pv_next

; ── JNZ addr: if flag != 0, PC = operand2 ─────────────────
pv_op_jnz:
    CMPI r15, 0             ; is pixel flag zero?
    CMPI r2, 0              ; r2=0 means flag was 0
    JZ r2, pv_next         ; flag is 0, don't jump
    MOV r14, r3             ; PC = operand2
    JMP pv_loop            ; fetch from new PC (skip PC++)

; ── Next instruction ──────────────────────────────────────
pv_next:
    ADDI r14, 1             ; PC++
    JMP pv_loop

pv_halt:
    HALT
