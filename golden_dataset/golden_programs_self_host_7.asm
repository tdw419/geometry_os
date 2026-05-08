; DESCRIPTION: Draws a colored line at the screen with fixed size.

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
LDI r14, 35
CALL w
LDI r14, 100
CALL w
LDI r14, 101
CALL w
LDI r14, 102
CALL w
LDI r14, 105
CALL w
LDI r14, 110
CALL w
LDI r14, 101
CALL w
LDI r14, 32
CALL w
LDI r14, 87
CALL w
LDI r14, 32
CALL w
LDI r14, 50
CALL w
LDI r14, 53
CALL w
LDI r14, 54
CALL w
LDI r14, 10
CALL w

; Write "LDI r2, 0"
LDI r14, 76
CALL w
LDI r14, 68
CALL w
LDI r14, 73
CALL w
LDI r14, 32
CALL w
LDI r14, 114
CALL w
LDI r14, 53
CALL w
LDI r14, 44
CALL w
LDI r14, 32
CALL w
LDI r14, 48
CALL w
LDI r14, 10
CALL w

; Write "LDI r9, 1"
LDI r14, 76
CALL w
LDI r14, 68
CALL w
LDI r14, 73
CALL w
LDI r14, 32
CALL w
LDI r14, 114
CALL w
LDI r14, 55
CALL w
LDI r14, 44
CALL w
LDI r14, 32
CALL w
LDI r14, 49
CALL w
LDI r14, 10
CALL w

; Write "LDI r6, W"
LDI r14, 76
CALL w
LDI r14, 68
CALL w
LDI r14, 73
CALL w
LDI r14, 32
CALL w
LDI r14, 114
CALL w
LDI r14, 56
CALL w
LDI r14, 44
CALL w
LDI r14, 32
CALL w
LDI r14, 87
CALL w
LDI r14, 10
CALL w

; Write "loop:"
LDI r14, 108
CALL w
LDI r14, 111
CALL w
LDI r14, 111
CALL w
LDI r14, 112
CALL w
LDI r14, 58
CALL w
LDI r14, 10
CALL w

; Write "  LDI r14, 0"
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 76
CALL w
LDI r14, 68
CALL w
LDI r14, 73
CALL w
LDI r14, 32
CALL w
LDI r14, 114
CALL w
LDI r14, 50
CALL w
LDI r14, 44
CALL w
LDI r14, 32
CALL w
LDI r14, 48
CALL w
LDI r14, 10
CALL w

; Write "  xloop:"
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 120
CALL w
LDI r14, 108
CALL w
LDI r14, 111
CALL w
LDI r14, 111
CALL w
LDI r14, 112
CALL w
LDI r14, 58
CALL w
LDI r14, 10
CALL w

; Write "    MOV r5, r2"
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 77
CALL w
LDI r14, 79
CALL w
LDI r14, 86
CALL w
LDI r14, 32
CALL w
LDI r14, 114
CALL w
LDI r14, 51
CALL w
LDI r14, 44
CALL w
LDI r14, 32
CALL w
LDI r14, 114
CALL w
LDI r14, 53
CALL w
LDI r14, 10
CALL w

; Write "    ADD r5, r14"
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 65
CALL w
LDI r14, 68
CALL w
LDI r14, 68
CALL w
LDI r14, 32
CALL w
LDI r14, 114
CALL w
LDI r14, 51
CALL w
LDI r14, 44
CALL w
LDI r14, 32
CALL w
LDI r14, 114
CALL w
LDI r14, 50
CALL w
LDI r14, 10
CALL w

; Write "    LDI r1, 255"
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 76
CALL w
LDI r14, 68
CALL w
LDI r14, 73
CALL w
LDI r14, 32
CALL w
LDI r14, 114
CALL w
LDI r14, 57
CALL w
LDI r14, 44
CALL w
LDI r14, 32
CALL w
LDI r14, 50
CALL w
LDI r14, 53
CALL w
LDI r14, 53
CALL w
LDI r14, 10
CALL w

; Write "    AND r5, r1"
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 65
CALL w
LDI r14, 78
CALL w
LDI r14, 68
CALL w
LDI r14, 32
CALL w
LDI r14, 114
CALL w
LDI r14, 51
CALL w
LDI r14, 44
CALL w
LDI r14, 32
CALL w
LDI r14, 114
CALL w
LDI r14, 57
CALL w
LDI r14, 10
CALL w

; Write "    PSET r14, r2, r5"
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 80
CALL w
LDI r14, 83
CALL w
LDI r14, 69
CALL w
LDI r14, 84
CALL w
LDI r14, 32
CALL w
LDI r14, 114
CALL w
LDI r14, 50
CALL w
LDI r14, 44
CALL w
LDI r14, 32
CALL w
LDI r14, 114
CALL w
LDI r14, 53
CALL w
LDI r14, 44
CALL w
LDI r14, 32
CALL w
LDI r14, 114
CALL w
LDI r14, 51
CALL w
LDI r14, 10
CALL w

; Write "    ADD r14, r9"
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 65
CALL w
LDI r14, 68
CALL w
LDI r14, 68
CALL w
LDI r14, 32
CALL w
LDI r14, 114
CALL w
LDI r14, 50
CALL w
LDI r14, 44
CALL w
LDI r14, 32
CALL w
LDI r14, 114
CALL w
LDI r14, 55
CALL w
LDI r14, 10
CALL w

; Write "    CMP r14, r6"
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 67
CALL w
LDI r14, 77
CALL w
LDI r14, 80
CALL w
LDI r14, 32
CALL w
LDI r14, 114
CALL w
LDI r14, 50
CALL w
LDI r14, 44
CALL w
LDI r14, 32
CALL w
LDI r14, 114
CALL w
LDI r14, 56
CALL w
LDI r14, 10
CALL w

; Write "    BLT r10, xloop"
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 66
CALL w
LDI r14, 76
CALL w
LDI r14, 84
CALL w
LDI r14, 32
CALL w
LDI r14, 114
CALL w
LDI r14, 48
CALL w
LDI r14, 44
CALL w
LDI r14, 32
CALL w
LDI r14, 120
CALL w
LDI r14, 108
CALL w
LDI r14, 111
CALL w
LDI r14, 111
CALL w
LDI r14, 112
CALL w
LDI r14, 10
CALL w

; Write "  ADD r2, r9"
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 65
CALL w
LDI r14, 68
CALL w
LDI r14, 68
CALL w
LDI r14, 32
CALL w
LDI r14, 114
CALL w
LDI r14, 53
CALL w
LDI r14, 44
CALL w
LDI r14, 32
CALL w
LDI r14, 114
CALL w
LDI r14, 55
CALL w
LDI r14, 10
CALL w

; Write "  CMP r2, r6"
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 67
CALL w
LDI r14, 77
CALL w
LDI r14, 80
CALL w
LDI r14, 32
CALL w
LDI r14, 114
CALL w
LDI r14, 53
CALL w
LDI r14, 44
CALL w
LDI r14, 32
CALL w
LDI r14, 114
CALL w
LDI r14, 56
CALL w
LDI r14, 10
CALL w

; Write "  BLT r10, loop"
LDI r14, 32
CALL w
LDI r14, 32
CALL w
LDI r14, 66
CALL w
LDI r14, 76
CALL w
LDI r14, 84
CALL w
LDI r14, 32
CALL w
LDI r14, 114
CALL w
LDI r14, 48
CALL w
LDI r14, 44
CALL w
LDI r14, 32
CALL w
LDI r14, 108
CALL w
LDI r14, 111
CALL w
LDI r14, 111
CALL w
LDI r14, 112
CALL w
LDI r14, 10
CALL w

; Write "HALT"
LDI r14, 72
CALL w
LDI r14, 65
CALL w
LDI r14, 76
CALL w
LDI r14, 84
CALL w
LDI r14, 10
CALL w

; Null-terminate the source text
LDI r14, 0
CALL w

; Assemble the source text
LDI r2, 0x0800
LDI r0, 0x1000
ASM r2, r0

; Check for assembly error
LDI r2, 0xFFD
LOAD r9, r2
LDI r6, 0xFFFFFFFF
CMP r9, r6
JZ r10, asm_error

; Run the compiled code at 0x1000
JMP 0x1000

asm_error:
    LDI r10, 0xFF0000
    FILL r10
    HALT

; ---- Subroutine: write character r14 at address in r12, advance r12 ----
w:
    STORE r12, r14
    LDI r5, 1
    ADD r12, r5
    RET
