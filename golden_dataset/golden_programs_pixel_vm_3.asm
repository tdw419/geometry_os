; DESCRIPTION: The `pixel_vm.asm` code implements a virtual machine (VM) that executes instructions encoded as pixels in screen memory. Each pixel represents an instruction with its opcode and operands extracted from the RGBA channels, allowing the VM to perform operations like loading/storing values, arithmetic, comparisons, and conditional jumps, while maintaining its state visible on the screen.

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
;   r4  = GeOS zero/flag (CMP sets this)
;   r14  = pixel-VM PC (instruction index)
;   r3  = fetched pixel-instruction (raw u32)
;   r10  = decoded opcode (R channel, bits 31-24)
;   r8  = decoded operand1 (G channel, bits 23-16)
;   r7  = decoded operand2 (B channel, bits 15-8)
;   r1  = base address of pixel program in screen (0x10000)
;   r15  = base address of pixel registers in screen (0x10100)
;   r11  = base address of pixel data memory in screen (0x10200)
;   r0  = pixel-VM flag register (0=equal, 1=not-equal from CMPI)
;   r12-r13 = temp

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
    LDI r1, PV_PROG_BASE
    LDI r15, PV_REG_BASE
    LDI r11, PV_DATA_BASE
    LDI r14, 0              ; pixel-VM PC = 0
    LDI r0, 0              ; pixel-VM flag = 0

pv_loop:
    ; ── Fetch: screen[PV_PROG_BASE + PC] ──
    MOV r12, r1
    ADD r12, r14            ; r12 = PV_PROG_BASE + PC
    LOAD r3, r12           ; r3 = pixel-instruction u32

    ; ── Decode R channel (opcode): (r3 >> 24) & 0xFF ──
    LDI r2, 24
    MOV r10, r3
    SHR r10, r2
    ANDI r10, 0xFF

    ; ── Decode G channel (operand1): (r3 >> 16) & 0xFF ──
    LDI r2, 16
    MOV r8, r3
    SHR r8, r2
    ANDI r8, 0xFF

    ; ── Decode B channel (operand2): (r3 >> 8) & 0xFF ──
    LDI r2, 8
    MOV r7, r3
    SHR r7, r2
    ANDI r7, 0xFF

    ; ── Dispatch on opcode ──
    CMPI r10, PV_HALT
    CMPI r4, 0
    JZ r4, pv_halt

    CMPI r10, PV_LOADI
    CMPI r4, 0
    JZ r4, pv_op_loadi

    CMPI r10, PV_ADD
    CMPI r4, 0
    JZ r4, pv_op_add

    CMPI r10, PV_SUB
    CMPI r4, 0
    JZ r4, pv_op_sub

    CMPI r10, PV_MUL
    CMPI r4, 0
    JZ r4, pv_op_mul

    CMPI r10, PV_STORE
    CMPI r4, 0
    JZ r4, pv_op_store

    CMPI r10, PV_LOAD
    CMPI r4, 0
    JZ r4, pv_op_load

    CMPI r10, PV_CMPI
    CMPI r4, 0
    JZ r4, pv_op_cmpi

    CMPI r10, PV_JNZ
    CMPI r4, 0
    JZ r4, pv_op_jnz

    ; Unknown opcode -- skip
    JMP pv_next

; ── LOADI reg, imm: pv_regs[operand1] = operand2 ──────────
pv_op_loadi:
    MOV r12, r15
    ADD r12, r8            ; r12 = PV_REG_BASE + reg
    STORE r12, r7          ; screen[PV_REG_BASE + reg] = imm
    JMP pv_next

; ── ADD dest, src: pv_regs[dest] += pv_regs[src] ─────────
pv_op_add:
    MOV r12, r15
    ADD r12, r8            ; addr of pv_regs[dest]
    LOAD r6, r12          ; r6 = pv_regs[dest]
    MOV r9, r15
    ADD r9, r7            ; addr of pv_regs[src]
    LOAD r5, r9          ; r5 = pv_regs[src]
    ADD r6, r5
    STORE r12, r6         ; pv_regs[dest] = result
    JMP pv_next

; ── SUB dest, src ─────────────────────────────────────────
pv_op_sub:
    MOV r12, r15
    ADD r12, r8
    LOAD r6, r12
    MOV r9, r15
    ADD r9, r7
    LOAD r5, r9
    SUB r6, r5
    STORE r12, r6
    JMP pv_next

; ── MUL dest, src ─────────────────────────────────────────
pv_op_mul:
    MOV r12, r15
    ADD r12, r8
    LOAD r6, r12
    MOV r9, r15
    ADD r9, r7
    LOAD r5, r9
    MUL r6, r5
    STORE r12, r6
    JMP pv_next

; ── STORE reg, addr: pv_data[operand2] = pv_regs[operand1] ─
pv_op_store:
    MOV r12, r15
    ADD r12, r8            ; addr of pv_regs[reg]
    LOAD r6, r12          ; r6 = pv_regs[reg]
    MOV r9, r11
    ADD r9, r7            ; addr of pv_data[addr]
    STORE r9, r6         ; pv_data[addr] = pv_regs[reg]
    JMP pv_next

; ── LOAD reg, addr: pv_regs[operand1] = pv_data[operand2] ─
pv_op_load:
    MOV r12, r11
    ADD r12, r7            ; addr of pv_data[addr]
    LOAD r6, r12          ; r6 = pv_data[addr]
    MOV r9, r15
    ADD r9, r8            ; addr of pv_regs[reg]
    STORE r9, r6         ; pv_regs[reg] = pv_data[addr]
    JMP pv_next

; ── CMPI reg, imm: flag = (pv_regs[reg] == imm) ? 0 : 1 ─
pv_op_cmpi:
    MOV r12, r15
    ADD r12, r8            ; addr of pv_regs[reg]
    LOAD r6, r12          ; r6 = pv_regs[reg]
    ; Compare r6 with operand2 (r7)
    ; GeOS CMP sets r4: 0=equal, 1=less, 2=greater
    CMP r6, r7
    ; If r4 == 0, values are equal -> pixel flag = 0
    ; If r4 != 0, values differ -> pixel flag = 1
    CMPI r4, 0
    CMPI r4, 0              ; double-negation: r4 was 0 means equal
    JZ r4, pv_cmpi_eq
    LDI r0, 1              ; flag = 1 (not equal)
    JMP pv_next
pv_cmpi_eq:
    LDI r0, 0              ; flag = 0 (equal)
    JMP pv_next

; ── JNZ addr: if flag != 0, PC = operand2 ─────────────────
pv_op_jnz:
    CMPI r0, 0             ; is pixel flag zero?
    CMPI r4, 0              ; r4=0 means flag was 0
    JZ r4, pv_next         ; flag is 0, don't jump
    MOV r14, r7             ; PC = operand2
    JMP pv_loop            ; fetch from new PC (skip PC++)

; ── Next instruction ──────────────────────────────────────
pv_next:
    ADDI r14, 1             ; PC++
    JMP pv_loop

pv_halt:
    HALT
