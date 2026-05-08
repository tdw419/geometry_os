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

LDI r2, 0x0800       ; destination for source text

; Write "#define W 256"
LDI r12, 35
CALL w
LDI r12, 100
CALL w
LDI r12, 101
CALL w
LDI r12, 102
CALL w
LDI r12, 105
CALL w
LDI r12, 110
CALL w
LDI r12, 101
CALL w
LDI r12, 32
CALL w
LDI r12, 87
CALL w
LDI r12, 32
CALL w
LDI r12, 50
CALL w
LDI r12, 53
CALL w
LDI r12, 54
CALL w
LDI r12, 10
CALL w

; Write "LDI r7, 0"
LDI r12, 76
CALL w
LDI r12, 68
CALL w
LDI r12, 73
CALL w
LDI r12, 32
CALL w
LDI r12, 114
CALL w
LDI r12, 53
CALL w
LDI r12, 44
CALL w
LDI r12, 32
CALL w
LDI r12, 48
CALL w
LDI r12, 10
CALL w

; Write "LDI r9, 1"
LDI r12, 76
CALL w
LDI r12, 68
CALL w
LDI r12, 73
CALL w
LDI r12, 32
CALL w
LDI r12, 114
CALL w
LDI r12, 55
CALL w
LDI r12, 44
CALL w
LDI r12, 32
CALL w
LDI r12, 49
CALL w
LDI r12, 10
CALL w

; Write "LDI r1, W"
LDI r12, 76
CALL w
LDI r12, 68
CALL w
LDI r12, 73
CALL w
LDI r12, 32
CALL w
LDI r12, 114
CALL w
LDI r12, 56
CALL w
LDI r12, 44
CALL w
LDI r12, 32
CALL w
LDI r12, 87
CALL w
LDI r12, 10
CALL w

; Write "loop:"
LDI r12, 108
CALL w
LDI r12, 111
CALL w
LDI r12, 111
CALL w
LDI r12, 112
CALL w
LDI r12, 58
CALL w
LDI r12, 10
CALL w

; Write "  LDI r12, 0"
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 76
CALL w
LDI r12, 68
CALL w
LDI r12, 73
CALL w
LDI r12, 32
CALL w
LDI r12, 114
CALL w
LDI r12, 50
CALL w
LDI r12, 44
CALL w
LDI r12, 32
CALL w
LDI r12, 48
CALL w
LDI r12, 10
CALL w

; Write "  xloop:"
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 120
CALL w
LDI r12, 108
CALL w
LDI r12, 111
CALL w
LDI r12, 111
CALL w
LDI r12, 112
CALL w
LDI r12, 58
CALL w
LDI r12, 10
CALL w

; Write "    MOV r4, r7"
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 77
CALL w
LDI r12, 79
CALL w
LDI r12, 86
CALL w
LDI r12, 32
CALL w
LDI r12, 114
CALL w
LDI r12, 51
CALL w
LDI r12, 44
CALL w
LDI r12, 32
CALL w
LDI r12, 114
CALL w
LDI r12, 53
CALL w
LDI r12, 10
CALL w

; Write "    ADD r4, r12"
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 65
CALL w
LDI r12, 68
CALL w
LDI r12, 68
CALL w
LDI r12, 32
CALL w
LDI r12, 114
CALL w
LDI r12, 51
CALL w
LDI r12, 44
CALL w
LDI r12, 32
CALL w
LDI r12, 114
CALL w
LDI r12, 50
CALL w
LDI r12, 10
CALL w

; Write "    LDI r10, 255"
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 76
CALL w
LDI r12, 68
CALL w
LDI r12, 73
CALL w
LDI r12, 32
CALL w
LDI r12, 114
CALL w
LDI r12, 57
CALL w
LDI r12, 44
CALL w
LDI r12, 32
CALL w
LDI r12, 50
CALL w
LDI r12, 53
CALL w
LDI r12, 53
CALL w
LDI r12, 10
CALL w

; Write "    AND r4, r10"
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 65
CALL w
LDI r12, 78
CALL w
LDI r12, 68
CALL w
LDI r12, 32
CALL w
LDI r12, 114
CALL w
LDI r12, 51
CALL w
LDI r12, 44
CALL w
LDI r12, 32
CALL w
LDI r12, 114
CALL w
LDI r12, 57
CALL w
LDI r12, 10
CALL w

; Write "    PSET r12, r7, r4"
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 80
CALL w
LDI r12, 83
CALL w
LDI r12, 69
CALL w
LDI r12, 84
CALL w
LDI r12, 32
CALL w
LDI r12, 114
CALL w
LDI r12, 50
CALL w
LDI r12, 44
CALL w
LDI r12, 32
CALL w
LDI r12, 114
CALL w
LDI r12, 53
CALL w
LDI r12, 44
CALL w
LDI r12, 32
CALL w
LDI r12, 114
CALL w
LDI r12, 51
CALL w
LDI r12, 10
CALL w

; Write "    ADD r12, r9"
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 65
CALL w
LDI r12, 68
CALL w
LDI r12, 68
CALL w
LDI r12, 32
CALL w
LDI r12, 114
CALL w
LDI r12, 50
CALL w
LDI r12, 44
CALL w
LDI r12, 32
CALL w
LDI r12, 114
CALL w
LDI r12, 55
CALL w
LDI r12, 10
CALL w

; Write "    CMP r12, r1"
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 67
CALL w
LDI r12, 77
CALL w
LDI r12, 80
CALL w
LDI r12, 32
CALL w
LDI r12, 114
CALL w
LDI r12, 50
CALL w
LDI r12, 44
CALL w
LDI r12, 32
CALL w
LDI r12, 114
CALL w
LDI r12, 56
CALL w
LDI r12, 10
CALL w

; Write "    BLT r14, xloop"
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 66
CALL w
LDI r12, 76
CALL w
LDI r12, 84
CALL w
LDI r12, 32
CALL w
LDI r12, 114
CALL w
LDI r12, 48
CALL w
LDI r12, 44
CALL w
LDI r12, 32
CALL w
LDI r12, 120
CALL w
LDI r12, 108
CALL w
LDI r12, 111
CALL w
LDI r12, 111
CALL w
LDI r12, 112
CALL w
LDI r12, 10
CALL w

; Write "  ADD r7, r9"
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 65
CALL w
LDI r12, 68
CALL w
LDI r12, 68
CALL w
LDI r12, 32
CALL w
LDI r12, 114
CALL w
LDI r12, 53
CALL w
LDI r12, 44
CALL w
LDI r12, 32
CALL w
LDI r12, 114
CALL w
LDI r12, 55
CALL w
LDI r12, 10
CALL w

; Write "  CMP r7, r1"
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 67
CALL w
LDI r12, 77
CALL w
LDI r12, 80
CALL w
LDI r12, 32
CALL w
LDI r12, 114
CALL w
LDI r12, 53
CALL w
LDI r12, 44
CALL w
LDI r12, 32
CALL w
LDI r12, 114
CALL w
LDI r12, 56
CALL w
LDI r12, 10
CALL w

; Write "  BLT r14, loop"
LDI r12, 32
CALL w
LDI r12, 32
CALL w
LDI r12, 66
CALL w
LDI r12, 76
CALL w
LDI r12, 84
CALL w
LDI r12, 32
CALL w
LDI r12, 114
CALL w
LDI r12, 48
CALL w
LDI r12, 44
CALL w
LDI r12, 32
CALL w
LDI r12, 108
CALL w
LDI r12, 111
CALL w
LDI r12, 111
CALL w
LDI r12, 112
CALL w
LDI r12, 10
CALL w

; Write "HALT"
LDI r12, 72
CALL w
LDI r12, 65
CALL w
LDI r12, 76
CALL w
LDI r12, 84
CALL w
LDI r12, 10
CALL w

; Null-terminate the source text
LDI r12, 0
CALL w

; Assemble the source text
LDI r7, 0x0800
LDI r3, 0x1000
ASM r7, r3

; Check for assembly error
LDI r7, 0xFFD
LOAD r9, r7
LDI r1, 0xFFFFFFFF
CMP r9, r1
JZ r14, asm_error

; Run the compiled code at 0x1000
JMP 0x1000

asm_error:
    LDI r14, 0xFF0000
    FILL r14
    HALT

; ---- Subroutine: write character r12 at address in r2, advance r2 ----
w:
    STORE r2, r12
    LDI r4, 1
    ADD r2, r4
    RET
