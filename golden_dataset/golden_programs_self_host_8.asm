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

LDI r12, 0x0800       ; destination for source text

; Write "#define W 256"
LDI r2, 35
CALL w
LDI r2, 100
CALL w
LDI r2, 101
CALL w
LDI r2, 102
CALL w
LDI r2, 105
CALL w
LDI r2, 110
CALL w
LDI r2, 101
CALL w
LDI r2, 32
CALL w
LDI r2, 87
CALL w
LDI r2, 32
CALL w
LDI r2, 50
CALL w
LDI r2, 53
CALL w
LDI r2, 54
CALL w
LDI r2, 10
CALL w

; Write "LDI r1, 0"
LDI r2, 76
CALL w
LDI r2, 68
CALL w
LDI r2, 73
CALL w
LDI r2, 32
CALL w
LDI r2, 114
CALL w
LDI r2, 53
CALL w
LDI r2, 44
CALL w
LDI r2, 32
CALL w
LDI r2, 48
CALL w
LDI r2, 10
CALL w

; Write "LDI r13, 1"
LDI r2, 76
CALL w
LDI r2, 68
CALL w
LDI r2, 73
CALL w
LDI r2, 32
CALL w
LDI r2, 114
CALL w
LDI r2, 55
CALL w
LDI r2, 44
CALL w
LDI r2, 32
CALL w
LDI r2, 49
CALL w
LDI r2, 10
CALL w

; Write "LDI r15, W"
LDI r2, 76
CALL w
LDI r2, 68
CALL w
LDI r2, 73
CALL w
LDI r2, 32
CALL w
LDI r2, 114
CALL w
LDI r2, 56
CALL w
LDI r2, 44
CALL w
LDI r2, 32
CALL w
LDI r2, 87
CALL w
LDI r2, 10
CALL w

; Write "loop:"
LDI r2, 108
CALL w
LDI r2, 111
CALL w
LDI r2, 111
CALL w
LDI r2, 112
CALL w
LDI r2, 58
CALL w
LDI r2, 10
CALL w

; Write "  LDI r2, 0"
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 76
CALL w
LDI r2, 68
CALL w
LDI r2, 73
CALL w
LDI r2, 32
CALL w
LDI r2, 114
CALL w
LDI r2, 50
CALL w
LDI r2, 44
CALL w
LDI r2, 32
CALL w
LDI r2, 48
CALL w
LDI r2, 10
CALL w

; Write "  xloop:"
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 120
CALL w
LDI r2, 108
CALL w
LDI r2, 111
CALL w
LDI r2, 111
CALL w
LDI r2, 112
CALL w
LDI r2, 58
CALL w
LDI r2, 10
CALL w

; Write "    MOV r3, r1"
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 77
CALL w
LDI r2, 79
CALL w
LDI r2, 86
CALL w
LDI r2, 32
CALL w
LDI r2, 114
CALL w
LDI r2, 51
CALL w
LDI r2, 44
CALL w
LDI r2, 32
CALL w
LDI r2, 114
CALL w
LDI r2, 53
CALL w
LDI r2, 10
CALL w

; Write "    ADD r3, r2"
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 65
CALL w
LDI r2, 68
CALL w
LDI r2, 68
CALL w
LDI r2, 32
CALL w
LDI r2, 114
CALL w
LDI r2, 51
CALL w
LDI r2, 44
CALL w
LDI r2, 32
CALL w
LDI r2, 114
CALL w
LDI r2, 50
CALL w
LDI r2, 10
CALL w

; Write "    LDI r6, 255"
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 76
CALL w
LDI r2, 68
CALL w
LDI r2, 73
CALL w
LDI r2, 32
CALL w
LDI r2, 114
CALL w
LDI r2, 57
CALL w
LDI r2, 44
CALL w
LDI r2, 32
CALL w
LDI r2, 50
CALL w
LDI r2, 53
CALL w
LDI r2, 53
CALL w
LDI r2, 10
CALL w

; Write "    AND r3, r6"
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 65
CALL w
LDI r2, 78
CALL w
LDI r2, 68
CALL w
LDI r2, 32
CALL w
LDI r2, 114
CALL w
LDI r2, 51
CALL w
LDI r2, 44
CALL w
LDI r2, 32
CALL w
LDI r2, 114
CALL w
LDI r2, 57
CALL w
LDI r2, 10
CALL w

; Write "    PSET r2, r1, r3"
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 80
CALL w
LDI r2, 83
CALL w
LDI r2, 69
CALL w
LDI r2, 84
CALL w
LDI r2, 32
CALL w
LDI r2, 114
CALL w
LDI r2, 50
CALL w
LDI r2, 44
CALL w
LDI r2, 32
CALL w
LDI r2, 114
CALL w
LDI r2, 53
CALL w
LDI r2, 44
CALL w
LDI r2, 32
CALL w
LDI r2, 114
CALL w
LDI r2, 51
CALL w
LDI r2, 10
CALL w

; Write "    ADD r2, r13"
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 65
CALL w
LDI r2, 68
CALL w
LDI r2, 68
CALL w
LDI r2, 32
CALL w
LDI r2, 114
CALL w
LDI r2, 50
CALL w
LDI r2, 44
CALL w
LDI r2, 32
CALL w
LDI r2, 114
CALL w
LDI r2, 55
CALL w
LDI r2, 10
CALL w

; Write "    CMP r2, r15"
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 67
CALL w
LDI r2, 77
CALL w
LDI r2, 80
CALL w
LDI r2, 32
CALL w
LDI r2, 114
CALL w
LDI r2, 50
CALL w
LDI r2, 44
CALL w
LDI r2, 32
CALL w
LDI r2, 114
CALL w
LDI r2, 56
CALL w
LDI r2, 10
CALL w

; Write "    BLT r7, xloop"
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 66
CALL w
LDI r2, 76
CALL w
LDI r2, 84
CALL w
LDI r2, 32
CALL w
LDI r2, 114
CALL w
LDI r2, 48
CALL w
LDI r2, 44
CALL w
LDI r2, 32
CALL w
LDI r2, 120
CALL w
LDI r2, 108
CALL w
LDI r2, 111
CALL w
LDI r2, 111
CALL w
LDI r2, 112
CALL w
LDI r2, 10
CALL w

; Write "  ADD r1, r13"
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 65
CALL w
LDI r2, 68
CALL w
LDI r2, 68
CALL w
LDI r2, 32
CALL w
LDI r2, 114
CALL w
LDI r2, 53
CALL w
LDI r2, 44
CALL w
LDI r2, 32
CALL w
LDI r2, 114
CALL w
LDI r2, 55
CALL w
LDI r2, 10
CALL w

; Write "  CMP r1, r15"
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 67
CALL w
LDI r2, 77
CALL w
LDI r2, 80
CALL w
LDI r2, 32
CALL w
LDI r2, 114
CALL w
LDI r2, 53
CALL w
LDI r2, 44
CALL w
LDI r2, 32
CALL w
LDI r2, 114
CALL w
LDI r2, 56
CALL w
LDI r2, 10
CALL w

; Write "  BLT r7, loop"
LDI r2, 32
CALL w
LDI r2, 32
CALL w
LDI r2, 66
CALL w
LDI r2, 76
CALL w
LDI r2, 84
CALL w
LDI r2, 32
CALL w
LDI r2, 114
CALL w
LDI r2, 48
CALL w
LDI r2, 44
CALL w
LDI r2, 32
CALL w
LDI r2, 108
CALL w
LDI r2, 111
CALL w
LDI r2, 111
CALL w
LDI r2, 112
CALL w
LDI r2, 10
CALL w

; Write "HALT"
LDI r2, 72
CALL w
LDI r2, 65
CALL w
LDI r2, 76
CALL w
LDI r2, 84
CALL w
LDI r2, 10
CALL w

; Null-terminate the source text
LDI r2, 0
CALL w

; Assemble the source text
LDI r1, 0x0800
LDI r0, 0x1000
ASM r1, r0

; Check for assembly error
LDI r1, 0xFFD
LOAD r13, r1
LDI r15, 0xFFFFFFFF
CMP r13, r15
JZ r7, asm_error

; Run the compiled code at 0x1000
JMP 0x1000

asm_error:
    LDI r7, 0xFF0000
    FILL r7
    HALT

; ---- Subroutine: write character r2 at address in r12, advance r12 ----
w:
    STORE r12, r2
    LDI r3, 1
    ADD r12, r3
    RET
