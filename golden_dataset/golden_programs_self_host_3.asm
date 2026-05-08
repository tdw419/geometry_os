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

LDI r4, 0x0800       ; destination for source text

; Write "#define W 256"
LDI r5, 35
CALL w
LDI r5, 100
CALL w
LDI r5, 101
CALL w
LDI r5, 102
CALL w
LDI r5, 105
CALL w
LDI r5, 110
CALL w
LDI r5, 101
CALL w
LDI r5, 32
CALL w
LDI r5, 87
CALL w
LDI r5, 32
CALL w
LDI r5, 50
CALL w
LDI r5, 53
CALL w
LDI r5, 54
CALL w
LDI r5, 10
CALL w

; Write "LDI r13, 0"
LDI r5, 76
CALL w
LDI r5, 68
CALL w
LDI r5, 73
CALL w
LDI r5, 32
CALL w
LDI r5, 114
CALL w
LDI r5, 53
CALL w
LDI r5, 44
CALL w
LDI r5, 32
CALL w
LDI r5, 48
CALL w
LDI r5, 10
CALL w

; Write "LDI r0, 1"
LDI r5, 76
CALL w
LDI r5, 68
CALL w
LDI r5, 73
CALL w
LDI r5, 32
CALL w
LDI r5, 114
CALL w
LDI r5, 55
CALL w
LDI r5, 44
CALL w
LDI r5, 32
CALL w
LDI r5, 49
CALL w
LDI r5, 10
CALL w

; Write "LDI r12, W"
LDI r5, 76
CALL w
LDI r5, 68
CALL w
LDI r5, 73
CALL w
LDI r5, 32
CALL w
LDI r5, 114
CALL w
LDI r5, 56
CALL w
LDI r5, 44
CALL w
LDI r5, 32
CALL w
LDI r5, 87
CALL w
LDI r5, 10
CALL w

; Write "loop:"
LDI r5, 108
CALL w
LDI r5, 111
CALL w
LDI r5, 111
CALL w
LDI r5, 112
CALL w
LDI r5, 58
CALL w
LDI r5, 10
CALL w

; Write "  LDI r5, 0"
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 76
CALL w
LDI r5, 68
CALL w
LDI r5, 73
CALL w
LDI r5, 32
CALL w
LDI r5, 114
CALL w
LDI r5, 50
CALL w
LDI r5, 44
CALL w
LDI r5, 32
CALL w
LDI r5, 48
CALL w
LDI r5, 10
CALL w

; Write "  xloop:"
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 120
CALL w
LDI r5, 108
CALL w
LDI r5, 111
CALL w
LDI r5, 111
CALL w
LDI r5, 112
CALL w
LDI r5, 58
CALL w
LDI r5, 10
CALL w

; Write "    MOV r14, r13"
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 77
CALL w
LDI r5, 79
CALL w
LDI r5, 86
CALL w
LDI r5, 32
CALL w
LDI r5, 114
CALL w
LDI r5, 51
CALL w
LDI r5, 44
CALL w
LDI r5, 32
CALL w
LDI r5, 114
CALL w
LDI r5, 53
CALL w
LDI r5, 10
CALL w

; Write "    ADD r14, r5"
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 65
CALL w
LDI r5, 68
CALL w
LDI r5, 68
CALL w
LDI r5, 32
CALL w
LDI r5, 114
CALL w
LDI r5, 51
CALL w
LDI r5, 44
CALL w
LDI r5, 32
CALL w
LDI r5, 114
CALL w
LDI r5, 50
CALL w
LDI r5, 10
CALL w

; Write "    LDI r3, 255"
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 76
CALL w
LDI r5, 68
CALL w
LDI r5, 73
CALL w
LDI r5, 32
CALL w
LDI r5, 114
CALL w
LDI r5, 57
CALL w
LDI r5, 44
CALL w
LDI r5, 32
CALL w
LDI r5, 50
CALL w
LDI r5, 53
CALL w
LDI r5, 53
CALL w
LDI r5, 10
CALL w

; Write "    AND r14, r3"
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 65
CALL w
LDI r5, 78
CALL w
LDI r5, 68
CALL w
LDI r5, 32
CALL w
LDI r5, 114
CALL w
LDI r5, 51
CALL w
LDI r5, 44
CALL w
LDI r5, 32
CALL w
LDI r5, 114
CALL w
LDI r5, 57
CALL w
LDI r5, 10
CALL w

; Write "    PSET r5, r13, r14"
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 80
CALL w
LDI r5, 83
CALL w
LDI r5, 69
CALL w
LDI r5, 84
CALL w
LDI r5, 32
CALL w
LDI r5, 114
CALL w
LDI r5, 50
CALL w
LDI r5, 44
CALL w
LDI r5, 32
CALL w
LDI r5, 114
CALL w
LDI r5, 53
CALL w
LDI r5, 44
CALL w
LDI r5, 32
CALL w
LDI r5, 114
CALL w
LDI r5, 51
CALL w
LDI r5, 10
CALL w

; Write "    ADD r5, r0"
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 65
CALL w
LDI r5, 68
CALL w
LDI r5, 68
CALL w
LDI r5, 32
CALL w
LDI r5, 114
CALL w
LDI r5, 50
CALL w
LDI r5, 44
CALL w
LDI r5, 32
CALL w
LDI r5, 114
CALL w
LDI r5, 55
CALL w
LDI r5, 10
CALL w

; Write "    CMP r5, r12"
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 67
CALL w
LDI r5, 77
CALL w
LDI r5, 80
CALL w
LDI r5, 32
CALL w
LDI r5, 114
CALL w
LDI r5, 50
CALL w
LDI r5, 44
CALL w
LDI r5, 32
CALL w
LDI r5, 114
CALL w
LDI r5, 56
CALL w
LDI r5, 10
CALL w

; Write "    BLT r7, xloop"
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 66
CALL w
LDI r5, 76
CALL w
LDI r5, 84
CALL w
LDI r5, 32
CALL w
LDI r5, 114
CALL w
LDI r5, 48
CALL w
LDI r5, 44
CALL w
LDI r5, 32
CALL w
LDI r5, 120
CALL w
LDI r5, 108
CALL w
LDI r5, 111
CALL w
LDI r5, 111
CALL w
LDI r5, 112
CALL w
LDI r5, 10
CALL w

; Write "  ADD r13, r0"
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 65
CALL w
LDI r5, 68
CALL w
LDI r5, 68
CALL w
LDI r5, 32
CALL w
LDI r5, 114
CALL w
LDI r5, 53
CALL w
LDI r5, 44
CALL w
LDI r5, 32
CALL w
LDI r5, 114
CALL w
LDI r5, 55
CALL w
LDI r5, 10
CALL w

; Write "  CMP r13, r12"
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 67
CALL w
LDI r5, 77
CALL w
LDI r5, 80
CALL w
LDI r5, 32
CALL w
LDI r5, 114
CALL w
LDI r5, 53
CALL w
LDI r5, 44
CALL w
LDI r5, 32
CALL w
LDI r5, 114
CALL w
LDI r5, 56
CALL w
LDI r5, 10
CALL w

; Write "  BLT r7, loop"
LDI r5, 32
CALL w
LDI r5, 32
CALL w
LDI r5, 66
CALL w
LDI r5, 76
CALL w
LDI r5, 84
CALL w
LDI r5, 32
CALL w
LDI r5, 114
CALL w
LDI r5, 48
CALL w
LDI r5, 44
CALL w
LDI r5, 32
CALL w
LDI r5, 108
CALL w
LDI r5, 111
CALL w
LDI r5, 111
CALL w
LDI r5, 112
CALL w
LDI r5, 10
CALL w

; Write "HALT"
LDI r5, 72
CALL w
LDI r5, 65
CALL w
LDI r5, 76
CALL w
LDI r5, 84
CALL w
LDI r5, 10
CALL w

; Null-terminate the source text
LDI r5, 0
CALL w

; Assemble the source text
LDI r13, 0x0800
LDI r6, 0x1000
ASM r13, r6

; Check for assembly error
LDI r13, 0xFFD
LOAD r0, r13
LDI r12, 0xFFFFFFFF
CMP r0, r12
JZ r7, asm_error

; Run the compiled code at 0x1000
JMP 0x1000

asm_error:
    LDI r7, 0xFF0000
    FILL r7
    HALT

; ---- Subroutine: write character r5 at address in r4, advance r4 ----
w:
    STORE r4, r5
    LDI r14, 1
    ADD r4, r14
    RET
