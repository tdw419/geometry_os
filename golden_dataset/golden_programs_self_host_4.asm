; DESCRIPTION: This GeOS assembly code demonstrates a self-hosting pipeline where it writes assembly source code to RAM character by character, assembles the code at runtime using an ASM opcode, checks for errors, and executes the assembled bytecode. The generated program includes instructions like LDI, MOV, ADD, AND, CMP, BLT, PSET, and HALT, all executed within a virtual machine environment.

; self_host.asm -- Enhanced Self-Hosting Pixel Assembler (Phase 70)
;
; Demonstrates the full self-hosting pipeline:
; 1. Write assembly source to RAM character by character
; 2. Assemble at runtime using ASM opcode (0x4B)
; 3. Check for errors via RAM[0xFFD]
; 4. Execute the assembled bytecode
;
; The generated program uses: #define, labels, LDI, MOV, ADD, AND,
; CMP, BLT, PSET, HALT -- all assembled from inside the VM.

LDI r12, 0x0800       ; destination for source text

; Write "#define W 256"
LDI r8, 35
CALL w
LDI r8, 100
CALL w
LDI r8, 101
CALL w
LDI r8, 102
CALL w
LDI r8, 105
CALL w
LDI r8, 110
CALL w
LDI r8, 101
CALL w
LDI r8, 32
CALL w
LDI r8, 87
CALL w
LDI r8, 32
CALL w
LDI r8, 50
CALL w
LDI r8, 53
CALL w
LDI r8, 54
CALL w
LDI r8, 10
CALL w

; Write "LDI r0, 0"
LDI r8, 76
CALL w
LDI r8, 68
CALL w
LDI r8, 73
CALL w
LDI r8, 32
CALL w
LDI r8, 114
CALL w
LDI r8, 53
CALL w
LDI r8, 44
CALL w
LDI r8, 32
CALL w
LDI r8, 48
CALL w
LDI r8, 10
CALL w

; Write "LDI r5, 1"
LDI r8, 76
CALL w
LDI r8, 68
CALL w
LDI r8, 73
CALL w
LDI r8, 32
CALL w
LDI r8, 114
CALL w
LDI r8, 55
CALL w
LDI r8, 44
CALL w
LDI r8, 32
CALL w
LDI r8, 49
CALL w
LDI r8, 10
CALL w

; Write "LDI r14, W"
LDI r8, 76
CALL w
LDI r8, 68
CALL w
LDI r8, 73
CALL w
LDI r8, 32
CALL w
LDI r8, 114
CALL w
LDI r8, 56
CALL w
LDI r8, 44
CALL w
LDI r8, 32
CALL w
LDI r8, 87
CALL w
LDI r8, 10
CALL w

; Write "loop:"
LDI r8, 108
CALL w
LDI r8, 111
CALL w
LDI r8, 111
CALL w
LDI r8, 112
CALL w
LDI r8, 58
CALL w
LDI r8, 10
CALL w

; Write "  LDI r8, 0"
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 76
CALL w
LDI r8, 68
CALL w
LDI r8, 73
CALL w
LDI r8, 32
CALL w
LDI r8, 114
CALL w
LDI r8, 50
CALL w
LDI r8, 44
CALL w
LDI r8, 32
CALL w
LDI r8, 48
CALL w
LDI r8, 10
CALL w

; Write "  xloop:"
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 120
CALL w
LDI r8, 108
CALL w
LDI r8, 111
CALL w
LDI r8, 111
CALL w
LDI r8, 112
CALL w
LDI r8, 58
CALL w
LDI r8, 10
CALL w

; Write "    MOV r10, r0"
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 77
CALL w
LDI r8, 79
CALL w
LDI r8, 86
CALL w
LDI r8, 32
CALL w
LDI r8, 114
CALL w
LDI r8, 51
CALL w
LDI r8, 44
CALL w
LDI r8, 32
CALL w
LDI r8, 114
CALL w
LDI r8, 53
CALL w
LDI r8, 10
CALL w

; Write "    ADD r10, r8"
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 65
CALL w
LDI r8, 68
CALL w
LDI r8, 68
CALL w
LDI r8, 32
CALL w
LDI r8, 114
CALL w
LDI r8, 51
CALL w
LDI r8, 44
CALL w
LDI r8, 32
CALL w
LDI r8, 114
CALL w
LDI r8, 50
CALL w
LDI r8, 10
CALL w

; Write "    LDI r7, 255"
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 76
CALL w
LDI r8, 68
CALL w
LDI r8, 73
CALL w
LDI r8, 32
CALL w
LDI r8, 114
CALL w
LDI r8, 57
CALL w
LDI r8, 44
CALL w
LDI r8, 32
CALL w
LDI r8, 50
CALL w
LDI r8, 53
CALL w
LDI r8, 53
CALL w
LDI r8, 10
CALL w

; Write "    AND r10, r7"
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 65
CALL w
LDI r8, 78
CALL w
LDI r8, 68
CALL w
LDI r8, 32
CALL w
LDI r8, 114
CALL w
LDI r8, 51
CALL w
LDI r8, 44
CALL w
LDI r8, 32
CALL w
LDI r8, 114
CALL w
LDI r8, 57
CALL w
LDI r8, 10
CALL w

; Write "    PSET r8, r0, r10"
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 80
CALL w
LDI r8, 83
CALL w
LDI r8, 69
CALL w
LDI r8, 84
CALL w
LDI r8, 32
CALL w
LDI r8, 114
CALL w
LDI r8, 50
CALL w
LDI r8, 44
CALL w
LDI r8, 32
CALL w
LDI r8, 114
CALL w
LDI r8, 53
CALL w
LDI r8, 44
CALL w
LDI r8, 32
CALL w
LDI r8, 114
CALL w
LDI r8, 51
CALL w
LDI r8, 10
CALL w

; Write "    ADD r8, r5"
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 65
CALL w
LDI r8, 68
CALL w
LDI r8, 68
CALL w
LDI r8, 32
CALL w
LDI r8, 114
CALL w
LDI r8, 50
CALL w
LDI r8, 44
CALL w
LDI r8, 32
CALL w
LDI r8, 114
CALL w
LDI r8, 55
CALL w
LDI r8, 10
CALL w

; Write "    CMP r8, r14"
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 67
CALL w
LDI r8, 77
CALL w
LDI r8, 80
CALL w
LDI r8, 32
CALL w
LDI r8, 114
CALL w
LDI r8, 50
CALL w
LDI r8, 44
CALL w
LDI r8, 32
CALL w
LDI r8, 114
CALL w
LDI r8, 56
CALL w
LDI r8, 10
CALL w

; Write "    BLT r3, xloop"
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 66
CALL w
LDI r8, 76
CALL w
LDI r8, 84
CALL w
LDI r8, 32
CALL w
LDI r8, 114
CALL w
LDI r8, 48
CALL w
LDI r8, 44
CALL w
LDI r8, 32
CALL w
LDI r8, 120
CALL w
LDI r8, 108
CALL w
LDI r8, 111
CALL w
LDI r8, 111
CALL w
LDI r8, 112
CALL w
LDI r8, 10
CALL w

; Write "  ADD r0, r5"
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 65
CALL w
LDI r8, 68
CALL w
LDI r8, 68
CALL w
LDI r8, 32
CALL w
LDI r8, 114
CALL w
LDI r8, 53
CALL w
LDI r8, 44
CALL w
LDI r8, 32
CALL w
LDI r8, 114
CALL w
LDI r8, 55
CALL w
LDI r8, 10
CALL w

; Write "  CMP r0, r14"
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 67
CALL w
LDI r8, 77
CALL w
LDI r8, 80
CALL w
LDI r8, 32
CALL w
LDI r8, 114
CALL w
LDI r8, 53
CALL w
LDI r8, 44
CALL w
LDI r8, 32
CALL w
LDI r8, 114
CALL w
LDI r8, 56
CALL w
LDI r8, 10
CALL w

; Write "  BLT r3, loop"
LDI r8, 32
CALL w
LDI r8, 32
CALL w
LDI r8, 66
CALL w
LDI r8, 76
CALL w
LDI r8, 84
CALL w
LDI r8, 32
CALL w
LDI r8, 114
CALL w
LDI r8, 48
CALL w
LDI r8, 44
CALL w
LDI r8, 32
CALL w
LDI r8, 108
CALL w
LDI r8, 111
CALL w
LDI r8, 111
CALL w
LDI r8, 112
CALL w
LDI r8, 10
CALL w

; Write "HALT"
LDI r8, 72
CALL w
LDI r8, 65
CALL w
LDI r8, 76
CALL w
LDI r8, 84
CALL w
LDI r8, 10
CALL w

; Null-terminate the source text
LDI r8, 0
CALL w

; Assemble the source text
LDI r0, 0x0800
LDI r11, 0x1000
ASM r0, r11

; Check for assembly error
LDI r0, 0xFFD
LOAD r5, r0
LDI r14, 0xFFFFFFFF
CMP r5, r14
JZ r3, asm_error

; Run the compiled code at 0x1000
JMP 0x1000

asm_error:
    LDI r3, 0xFF0000
    FILL r3
    HALT

; ---- Subroutine: write character r8 at address in r12, advance r12 ----
w:
    STORE r12, r8
    LDI r10, 1
    ADD r12, r10
    RET
