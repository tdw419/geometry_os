; DESCRIPTION: Geometry OS program to draw a colored line.

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

LDI r9, 0x0800       ; destination for source text

; Write "#define W 256"
LDI r7, 35
CALL w
LDI r7, 100
CALL w
LDI r7, 101
CALL w
LDI r7, 102
CALL w
LDI r7, 105
CALL w
LDI r7, 110
CALL w
LDI r7, 101
CALL w
LDI r7, 32
CALL w
LDI r7, 87
CALL w
LDI r7, 32
CALL w
LDI r7, 50
CALL w
LDI r7, 53
CALL w
LDI r7, 54
CALL w
LDI r7, 10
CALL w

; Write "LDI r3, 0"
LDI r7, 76
CALL w
LDI r7, 68
CALL w
LDI r7, 73
CALL w
LDI r7, 32
CALL w
LDI r7, 114
CALL w
LDI r7, 53
CALL w
LDI r7, 44
CALL w
LDI r7, 32
CALL w
LDI r7, 48
CALL w
LDI r7, 10
CALL w

; Write "LDI r6, 1"
LDI r7, 76
CALL w
LDI r7, 68
CALL w
LDI r7, 73
CALL w
LDI r7, 32
CALL w
LDI r7, 114
CALL w
LDI r7, 55
CALL w
LDI r7, 44
CALL w
LDI r7, 32
CALL w
LDI r7, 49
CALL w
LDI r7, 10
CALL w

; Write "LDI r12, W"
LDI r7, 76
CALL w
LDI r7, 68
CALL w
LDI r7, 73
CALL w
LDI r7, 32
CALL w
LDI r7, 114
CALL w
LDI r7, 56
CALL w
LDI r7, 44
CALL w
LDI r7, 32
CALL w
LDI r7, 87
CALL w
LDI r7, 10
CALL w

; Write "loop:"
LDI r7, 108
CALL w
LDI r7, 111
CALL w
LDI r7, 111
CALL w
LDI r7, 112
CALL w
LDI r7, 58
CALL w
LDI r7, 10
CALL w

; Write "  LDI r7, 0"
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 76
CALL w
LDI r7, 68
CALL w
LDI r7, 73
CALL w
LDI r7, 32
CALL w
LDI r7, 114
CALL w
LDI r7, 50
CALL w
LDI r7, 44
CALL w
LDI r7, 32
CALL w
LDI r7, 48
CALL w
LDI r7, 10
CALL w

; Write "  xloop:"
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 120
CALL w
LDI r7, 108
CALL w
LDI r7, 111
CALL w
LDI r7, 111
CALL w
LDI r7, 112
CALL w
LDI r7, 58
CALL w
LDI r7, 10
CALL w

; Write "    MOV r13, r3"
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 77
CALL w
LDI r7, 79
CALL w
LDI r7, 86
CALL w
LDI r7, 32
CALL w
LDI r7, 114
CALL w
LDI r7, 51
CALL w
LDI r7, 44
CALL w
LDI r7, 32
CALL w
LDI r7, 114
CALL w
LDI r7, 53
CALL w
LDI r7, 10
CALL w

; Write "    ADD r13, r7"
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 65
CALL w
LDI r7, 68
CALL w
LDI r7, 68
CALL w
LDI r7, 32
CALL w
LDI r7, 114
CALL w
LDI r7, 51
CALL w
LDI r7, 44
CALL w
LDI r7, 32
CALL w
LDI r7, 114
CALL w
LDI r7, 50
CALL w
LDI r7, 10
CALL w

; Write "    LDI r2, 255"
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 76
CALL w
LDI r7, 68
CALL w
LDI r7, 73
CALL w
LDI r7, 32
CALL w
LDI r7, 114
CALL w
LDI r7, 57
CALL w
LDI r7, 44
CALL w
LDI r7, 32
CALL w
LDI r7, 50
CALL w
LDI r7, 53
CALL w
LDI r7, 53
CALL w
LDI r7, 10
CALL w

; Write "    AND r13, r2"
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 65
CALL w
LDI r7, 78
CALL w
LDI r7, 68
CALL w
LDI r7, 32
CALL w
LDI r7, 114
CALL w
LDI r7, 51
CALL w
LDI r7, 44
CALL w
LDI r7, 32
CALL w
LDI r7, 114
CALL w
LDI r7, 57
CALL w
LDI r7, 10
CALL w

; Write "    PSET r7, r3, r13"
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 80
CALL w
LDI r7, 83
CALL w
LDI r7, 69
CALL w
LDI r7, 84
CALL w
LDI r7, 32
CALL w
LDI r7, 114
CALL w
LDI r7, 50
CALL w
LDI r7, 44
CALL w
LDI r7, 32
CALL w
LDI r7, 114
CALL w
LDI r7, 53
CALL w
LDI r7, 44
CALL w
LDI r7, 32
CALL w
LDI r7, 114
CALL w
LDI r7, 51
CALL w
LDI r7, 10
CALL w

; Write "    ADD r7, r6"
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 65
CALL w
LDI r7, 68
CALL w
LDI r7, 68
CALL w
LDI r7, 32
CALL w
LDI r7, 114
CALL w
LDI r7, 50
CALL w
LDI r7, 44
CALL w
LDI r7, 32
CALL w
LDI r7, 114
CALL w
LDI r7, 55
CALL w
LDI r7, 10
CALL w

; Write "    CMP r7, r12"
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 67
CALL w
LDI r7, 77
CALL w
LDI r7, 80
CALL w
LDI r7, 32
CALL w
LDI r7, 114
CALL w
LDI r7, 50
CALL w
LDI r7, 44
CALL w
LDI r7, 32
CALL w
LDI r7, 114
CALL w
LDI r7, 56
CALL w
LDI r7, 10
CALL w

; Write "    BLT r8, xloop"
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 66
CALL w
LDI r7, 76
CALL w
LDI r7, 84
CALL w
LDI r7, 32
CALL w
LDI r7, 114
CALL w
LDI r7, 48
CALL w
LDI r7, 44
CALL w
LDI r7, 32
CALL w
LDI r7, 120
CALL w
LDI r7, 108
CALL w
LDI r7, 111
CALL w
LDI r7, 111
CALL w
LDI r7, 112
CALL w
LDI r7, 10
CALL w

; Write "  ADD r3, r6"
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 65
CALL w
LDI r7, 68
CALL w
LDI r7, 68
CALL w
LDI r7, 32
CALL w
LDI r7, 114
CALL w
LDI r7, 53
CALL w
LDI r7, 44
CALL w
LDI r7, 32
CALL w
LDI r7, 114
CALL w
LDI r7, 55
CALL w
LDI r7, 10
CALL w

; Write "  CMP r3, r12"
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 67
CALL w
LDI r7, 77
CALL w
LDI r7, 80
CALL w
LDI r7, 32
CALL w
LDI r7, 114
CALL w
LDI r7, 53
CALL w
LDI r7, 44
CALL w
LDI r7, 32
CALL w
LDI r7, 114
CALL w
LDI r7, 56
CALL w
LDI r7, 10
CALL w

; Write "  BLT r8, loop"
LDI r7, 32
CALL w
LDI r7, 32
CALL w
LDI r7, 66
CALL w
LDI r7, 76
CALL w
LDI r7, 84
CALL w
LDI r7, 32
CALL w
LDI r7, 114
CALL w
LDI r7, 48
CALL w
LDI r7, 44
CALL w
LDI r7, 32
CALL w
LDI r7, 108
CALL w
LDI r7, 111
CALL w
LDI r7, 111
CALL w
LDI r7, 112
CALL w
LDI r7, 10
CALL w

; Write "HALT"
LDI r7, 72
CALL w
LDI r7, 65
CALL w
LDI r7, 76
CALL w
LDI r7, 84
CALL w
LDI r7, 10
CALL w

; Null-terminate the source text
LDI r7, 0
CALL w

; Assemble the source text
LDI r3, 0x0800
LDI r4, 0x1000
ASM r3, r4

; Check for assembly error
LDI r3, 0xFFD
LOAD r6, r3
LDI r12, 0xFFFFFFFF
CMP r6, r12
JZ r8, asm_error

; Run the compiled code at 0x1000
JMP 0x1000

asm_error:
    LDI r8, 0xFF0000
    FILL r8
    HALT

; ---- Subroutine: write character r7 at address in r9, advance r9 ----
w:
    STORE r9, r7
    LDI r13, 1
    ADD r9, r13
    RET
