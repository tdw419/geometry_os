; DESCRIPTION: Display a line using color colored at the screen.

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

LDI r6, 0x0800       ; destination for source text

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

; Write "LDI r14, 0"
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

; Write "LDI r0, 1"
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

; Write "    MOV r13, r14"
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

; Write "    ADD r13, r1"
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

; Write "    LDI r4, 255"
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

; Write "    AND r13, r4"
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

; Write "    PSET r1, r14, r13"
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

; Write "    ADD r1, r0"
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

; Write "    BLT r9, xloop"
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

; Write "  ADD r14, r0"
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

; Write "  CMP r14, r10"
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

; Write "  BLT r9, loop"
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
LDI r14, 0x0800
LDI r11, 0x1000
ASM r14, r11

; Check for assembly error
LDI r14, 0xFFD
LOAD r0, r14
LDI r10, 0xFFFFFFFF
CMP r0, r10
JZ r9, asm_error

; Run the compiled code at 0x1000
JMP 0x1000

asm_error:
    LDI r9, 0xFF0000
    FILL r9
    HALT

; ---- Subroutine: write character r1 at address in r6, advance r6 ----
w:
    STORE r6, r1
    LDI r13, 1
    ADD r6, r13
    RET
