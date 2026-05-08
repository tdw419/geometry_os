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
LDI r1, 35
CALL w
LDI r1, 100
CALL w
LDI r1, 101
CALL w
LDI r1, 102
CALL w
LDI r1, 105
CALL w
LDI r1, 110
CALL w
LDI r1, 101
CALL w
LDI r1, 32
CALL w
LDI r1, 87
CALL w
LDI r1, 32
CALL w
LDI r1, 50
CALL w
LDI r1, 53
CALL w
LDI r1, 54
CALL w
LDI r1, 10
CALL w

; Write "LDI r0, 0"
LDI r1, 76
CALL w
LDI r1, 68
CALL w
LDI r1, 73
CALL w
LDI r1, 32
CALL w
LDI r1, 114
CALL w
LDI r1, 53
CALL w
LDI r1, 44
CALL w
LDI r1, 32
CALL w
LDI r1, 48
CALL w
LDI r1, 10
CALL w

; Write "LDI r15, 1"
LDI r1, 76
CALL w
LDI r1, 68
CALL w
LDI r1, 73
CALL w
LDI r1, 32
CALL w
LDI r1, 114
CALL w
LDI r1, 55
CALL w
LDI r1, 44
CALL w
LDI r1, 32
CALL w
LDI r1, 49
CALL w
LDI r1, 10
CALL w

; Write "LDI r10, W"
LDI r1, 76
CALL w
LDI r1, 68
CALL w
LDI r1, 73
CALL w
LDI r1, 32
CALL w
LDI r1, 114
CALL w
LDI r1, 56
CALL w
LDI r1, 44
CALL w
LDI r1, 32
CALL w
LDI r1, 87
CALL w
LDI r1, 10
CALL w

; Write "loop:"
LDI r1, 108
CALL w
LDI r1, 111
CALL w
LDI r1, 111
CALL w
LDI r1, 112
CALL w
LDI r1, 58
CALL w
LDI r1, 10
CALL w

; Write "  LDI r1, 0"
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 76
CALL w
LDI r1, 68
CALL w
LDI r1, 73
CALL w
LDI r1, 32
CALL w
LDI r1, 114
CALL w
LDI r1, 50
CALL w
LDI r1, 44
CALL w
LDI r1, 32
CALL w
LDI r1, 48
CALL w
LDI r1, 10
CALL w

; Write "  xloop:"
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 120
CALL w
LDI r1, 108
CALL w
LDI r1, 111
CALL w
LDI r1, 111
CALL w
LDI r1, 112
CALL w
LDI r1, 58
CALL w
LDI r1, 10
CALL w

; Write "    MOV r2, r0"
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 77
CALL w
LDI r1, 79
CALL w
LDI r1, 86
CALL w
LDI r1, 32
CALL w
LDI r1, 114
CALL w
LDI r1, 51
CALL w
LDI r1, 44
CALL w
LDI r1, 32
CALL w
LDI r1, 114
CALL w
LDI r1, 53
CALL w
LDI r1, 10
CALL w

; Write "    ADD r2, r1"
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 65
CALL w
LDI r1, 68
CALL w
LDI r1, 68
CALL w
LDI r1, 32
CALL w
LDI r1, 114
CALL w
LDI r1, 51
CALL w
LDI r1, 44
CALL w
LDI r1, 32
CALL w
LDI r1, 114
CALL w
LDI r1, 50
CALL w
LDI r1, 10
CALL w

; Write "    LDI r6, 255"
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 76
CALL w
LDI r1, 68
CALL w
LDI r1, 73
CALL w
LDI r1, 32
CALL w
LDI r1, 114
CALL w
LDI r1, 57
CALL w
LDI r1, 44
CALL w
LDI r1, 32
CALL w
LDI r1, 50
CALL w
LDI r1, 53
CALL w
LDI r1, 53
CALL w
LDI r1, 10
CALL w

; Write "    AND r2, r6"
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 65
CALL w
LDI r1, 78
CALL w
LDI r1, 68
CALL w
LDI r1, 32
CALL w
LDI r1, 114
CALL w
LDI r1, 51
CALL w
LDI r1, 44
CALL w
LDI r1, 32
CALL w
LDI r1, 114
CALL w
LDI r1, 57
CALL w
LDI r1, 10
CALL w

; Write "    PSET r1, r0, r2"
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 80
CALL w
LDI r1, 83
CALL w
LDI r1, 69
CALL w
LDI r1, 84
CALL w
LDI r1, 32
CALL w
LDI r1, 114
CALL w
LDI r1, 50
CALL w
LDI r1, 44
CALL w
LDI r1, 32
CALL w
LDI r1, 114
CALL w
LDI r1, 53
CALL w
LDI r1, 44
CALL w
LDI r1, 32
CALL w
LDI r1, 114
CALL w
LDI r1, 51
CALL w
LDI r1, 10
CALL w

; Write "    ADD r1, r15"
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 65
CALL w
LDI r1, 68
CALL w
LDI r1, 68
CALL w
LDI r1, 32
CALL w
LDI r1, 114
CALL w
LDI r1, 50
CALL w
LDI r1, 44
CALL w
LDI r1, 32
CALL w
LDI r1, 114
CALL w
LDI r1, 55
CALL w
LDI r1, 10
CALL w

; Write "    CMP r1, r10"
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 67
CALL w
LDI r1, 77
CALL w
LDI r1, 80
CALL w
LDI r1, 32
CALL w
LDI r1, 114
CALL w
LDI r1, 50
CALL w
LDI r1, 44
CALL w
LDI r1, 32
CALL w
LDI r1, 114
CALL w
LDI r1, 56
CALL w
LDI r1, 10
CALL w

; Write "    BLT r3, xloop"
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 66
CALL w
LDI r1, 76
CALL w
LDI r1, 84
CALL w
LDI r1, 32
CALL w
LDI r1, 114
CALL w
LDI r1, 48
CALL w
LDI r1, 44
CALL w
LDI r1, 32
CALL w
LDI r1, 120
CALL w
LDI r1, 108
CALL w
LDI r1, 111
CALL w
LDI r1, 111
CALL w
LDI r1, 112
CALL w
LDI r1, 10
CALL w

; Write "  ADD r0, r15"
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 65
CALL w
LDI r1, 68
CALL w
LDI r1, 68
CALL w
LDI r1, 32
CALL w
LDI r1, 114
CALL w
LDI r1, 53
CALL w
LDI r1, 44
CALL w
LDI r1, 32
CALL w
LDI r1, 114
CALL w
LDI r1, 55
CALL w
LDI r1, 10
CALL w

; Write "  CMP r0, r10"
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 67
CALL w
LDI r1, 77
CALL w
LDI r1, 80
CALL w
LDI r1, 32
CALL w
LDI r1, 114
CALL w
LDI r1, 53
CALL w
LDI r1, 44
CALL w
LDI r1, 32
CALL w
LDI r1, 114
CALL w
LDI r1, 56
CALL w
LDI r1, 10
CALL w

; Write "  BLT r3, loop"
LDI r1, 32
CALL w
LDI r1, 32
CALL w
LDI r1, 66
CALL w
LDI r1, 76
CALL w
LDI r1, 84
CALL w
LDI r1, 32
CALL w
LDI r1, 114
CALL w
LDI r1, 48
CALL w
LDI r1, 44
CALL w
LDI r1, 32
CALL w
LDI r1, 108
CALL w
LDI r1, 111
CALL w
LDI r1, 111
CALL w
LDI r1, 112
CALL w
LDI r1, 10
CALL w

; Write "HALT"
LDI r1, 72
CALL w
LDI r1, 65
CALL w
LDI r1, 76
CALL w
LDI r1, 84
CALL w
LDI r1, 10
CALL w

; Null-terminate the source text
LDI r1, 0
CALL w

; Assemble the source text
LDI r0, 0x0800
LDI r14, 0x1000
ASM r0, r14

; Check for assembly error
LDI r0, 0xFFD
LOAD r15, r0
LDI r10, 0xFFFFFFFF
CMP r15, r10
JZ r3, asm_error

; Run the compiled code at 0x1000
JMP 0x1000

asm_error:
    LDI r3, 0xFF0000
    FILL r3
    HALT

; ---- Subroutine: write character r1 at address in r12, advance r12 ----
w:
    STORE r12, r1
    LDI r2, 1
    ADD r12, r2
    RET
