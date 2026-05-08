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

LDI r10, 0x0800       ; destination for source text

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

; Write "LDI r0, 0"
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

; Write "LDI r1, 1"
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

; Write "LDI r6, W"
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

; Write "    MOV r8, r0"
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

; Write "    ADD r8, r5"
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

; Write "    LDI r15, 255"
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

; Write "    AND r8, r15"
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

; Write "    PSET r5, r0, r8"
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

; Write "    ADD r5, r1"
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

; Write "    CMP r5, r6"
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

; Write "    BLT r2, xloop"
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

; Write "  ADD r0, r1"
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

; Write "  CMP r0, r6"
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

; Write "  BLT r2, loop"
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
LDI r0, 0x0800
LDI r11, 0x1000
ASM r0, r11

; Check for assembly error
LDI r0, 0xFFD
LOAD r1, r0
LDI r6, 0xFFFFFFFF
CMP r1, r6
JZ r2, asm_error

; Run the compiled code at 0x1000
JMP 0x1000

asm_error:
    LDI r2, 0xFF0000
    FILL r2
    HALT

; ---- Subroutine: write character r5 at address in r10, advance r10 ----
w:
    STORE r10, r5
    LDI r8, 1
    ADD r10, r8
    RET
