; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

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
;   r6  = GeOS zero/flag (CMP sets this)
;   r7  = pixel-VM PC (instruction index)
;   r11  = fetched pixel-instruction (raw u32)
;   r10  = decoded opcode (R channel, bits 31-24)
;   r5  = decoded operand1 (G channel, bits 23-16)
;   r9  = decoded operand2 (B channel, bits 15-8)
;   r14  = base address of pixel program in screen (0x10000)
;   r0  = base address of pixel registers in screen (0x10100)
;   r8  = base address of pixel data memory in screen (0x10200)
;   r1  = pixel-VM flag register (0=equal, 1=not-equal from CMPI)
;   r4-r3 = temp

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
    LDI r14, PV_PROG_BASE
    LDI r0, PV_REG_BASE
    LDI r8, PV_DATA_BASE
    LDI r7, 0              ; pixel-VM PC = 0
    LDI r1, 0              ; pixel-VM flag = 0

pv_loop:
    ; ── Fetch: screen[PV_PROG_BASE + PC] ──
    MOV r4, r14
    ADD r4, r7            ; r4 = PV_PROG_BASE + PC
    LOAD r11, r4           ; r11 = pixel-instruction u32

    ; ── Decode R channel (opcode): (r11 >> 24) & 0xFF ──
    LDI r13, 24
    MOV r10, r11
    SHR r10, r13
    ANDI r10, 0xFF

    ; ── Decode G channel (operand1): (r11 >> 16) & 0xFF ──
    LDI r13, 16
    MOV r5, r11
    SHR r5, r13
    ANDI r5, 0xFF

    ; ── Decode B channel (operand2): (r11 >> 8) & 0xFF ──
    LDI r13, 8
    MOV r9, r11
    SHR r9, r13
    ANDI r9, 0xFF

    ; ── Dispatch on opcode ──
    CMPI r10, PV_HALT
    CMPI r6, 0
    JZ r6, pv_halt

    CMPI r10, PV_LOADI
    CMPI r6, 0
    JZ r6, pv_op_loadi

    CMPI r10, PV_ADD
    CMPI r6, 0
    JZ r6, pv_op_add

    CMPI r10, PV_SUB
    CMPI r6, 0
    JZ r6, pv_op_sub

    CMPI r10, PV_MUL
    CMPI r6, 0
    JZ r6, pv_op_mul

    CMPI r10, PV_STORE
    CMPI r6, 0
    JZ r6, pv_op_store

    CMPI r10, PV_LOAD
    CMPI r6, 0
    JZ r6, pv_op_load

    CMPI r10, PV_CMPI
    CMPI r6, 0
    JZ r6, pv_op_cmpi

    CMPI r10, PV_JNZ
    CMPI r6, 0
    JZ r6, pv_op_jnz

    ; Unknown opcode -- skip
    JMP pv_next

; ── LOADI reg, imm: pv_regs[operand1] = operand2 ──────────
pv_op_loadi:
    MOV r4, r0
    ADD r4, r5            ; r4 = PV_REG_BASE + reg
    STORE r4, r9          ; screen[PV_REG_BASE + reg] = imm
    JMP pv_next

; ── ADD dest, src: pv_regs[dest] += pv_regs[src] ─────────
pv_op_add:
    MOV r4, r0
    ADD r4, r5            ; addr of pv_regs[dest]
    LOAD r2, r4          ; r2 = pv_regs[dest]
    MOV r15, r0
    ADD r15, r9            ; addr of pv_regs[src]
    LOAD r12, r15          ; r12 = pv_regs[src]
    ADD r2, r12
    STORE r4, r2         ; pv_regs[dest] = result
    JMP pv_next

; ── SUB dest, src ─────────────────────────────────────────
pv_op_sub:
    MOV r4, r0
    ADD r4, r5
    LOAD r2, r4
    MOV r15, r0
    ADD r15, r9
    LOAD r12, r15
    SUB r2, r12
    STORE r4, r2
    JMP pv_next

; ── MUL dest, src ─────────────────────────────────────────
pv_op_mul:
    MOV r4, r0
    ADD r4, r5
    LOAD r2, r4
    MOV r15, r0
    ADD r15, r9
    LOAD r12, r15
    MUL r2, r12
    STORE r4, r2
    JMP pv_next

; ── STORE reg, addr: pv_data[operand2] = pv_regs[operand1] ─
pv_op_store:
    MOV r4, r0
    ADD r4, r5            ; addr of pv_regs[reg]
    LOAD r2, r4          ; r2 = pv_regs[reg]
    MOV r15, r8
    ADD r15, r9            ; addr of pv_data[addr]
    STORE r15, r2         ; pv_data[addr] = pv_regs[reg]
    JMP pv_next

; ── LOAD reg, addr: pv_regs[operand1] = pv_data[operand2] ─
pv_op_load:
    MOV r4, r8
    ADD r4, r9            ; addr of pv_data[addr]
    LOAD r2, r4          ; r2 = pv_data[addr]
    MOV r15, r0
    ADD r15, r5            ; addr of pv_regs[reg]
    STORE r15, r2         ; pv_regs[reg] = pv_data[addr]
    JMP pv_next

; ── CMPI reg, imm: flag = (pv_regs[reg] == imm) ? 0 : 1 ─
pv_op_cmpi:
    MOV r4, r0
    ADD r4, r5            ; addr of pv_regs[reg]
    LOAD r2, r4          ; r2 = pv_regs[reg]
    ; Compare r2 with operand2 (r9)
    ; GeOS CMP sets r6: 0=equal, 1=less, 2=greater
    CMP r2, r9
    ; If r6 == 0, values are equal -> pixel flag = 0
    ; If r6 != 0, values differ -> pixel flag = 1
    CMPI r6, 0
    CMPI r6, 0              ; double-negation: r6 was 0 means equal
    JZ r6, pv_cmpi_eq
    LDI r1, 1              ; flag = 1 (not equal)
    JMP pv_next
pv_cmpi_eq:
    LDI r1, 0              ; flag = 0 (equal)
    JMP pv_next

; ── JNZ addr: if flag != 0, PC = operand2 ─────────────────
pv_op_jnz:
    CMPI r1, 0             ; is pixel flag zero?
    CMPI r6, 0              ; r6=0 means flag was 0
    JZ r6, pv_next         ; flag is 0, don't jump
    MOV r7, r9             ; PC = operand2
    JMP pv_loop            ; fetch from new PC (skip PC++)

; ── Next instruction ──────────────────────────────────────
pv_next:
    ADDI r7, 1             ; PC++
    JMP pv_loop

pv_halt:
    HALT
