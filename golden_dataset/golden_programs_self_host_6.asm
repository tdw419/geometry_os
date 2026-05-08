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

LDI r7, 0x0800       ; destination for source text

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

; Write "LDI r11, 0"
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

; Write "LDI r5, 1"
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

; Write "LDI r8, W"
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

; Write "    MOV r2, r11"
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

; Write "    PSET r1, r11, r2"
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

; Write "    ADD r1, r5"
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

; Write "    CMP r1, r8"
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

; Write "    BLT r10, xloop"
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

; Write "  ADD r11, r5"
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

; Write "  CMP r11, r8"
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

; Write "  BLT r10, loop"
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
LDI r11, 0x0800
LDI r15, 0x1000
ASM r11, r15

; Check for assembly error
LDI r11, 0xFFD
LOAD r5, r11
LDI r8, 0xFFFFFFFF
CMP r5, r8
JZ r10, asm_error

; Run the compiled code at 0x1000
JMP 0x1000

asm_error:
    LDI r10, 0xFF0000
    FILL r10
    HALT

; ---- Subroutine: write character r1 at address in r7, advance r7 ----
w:
    STORE r7, r1
    LDI r2, 1
    ADD r7, r2
    RET
