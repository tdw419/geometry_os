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

LDI r0, 0x0800       ; destination for source text

; Write "#define W 256"
LDI r6, 35
CALL w
LDI r6, 100
CALL w
LDI r6, 101
CALL w
LDI r6, 102
CALL w
LDI r6, 105
CALL w
LDI r6, 110
CALL w
LDI r6, 101
CALL w
LDI r6, 32
CALL w
LDI r6, 87
CALL w
LDI r6, 32
CALL w
LDI r6, 50
CALL w
LDI r6, 53
CALL w
LDI r6, 54
CALL w
LDI r6, 10
CALL w

; Write "LDI r8, 0"
LDI r6, 76
CALL w
LDI r6, 68
CALL w
LDI r6, 73
CALL w
LDI r6, 32
CALL w
LDI r6, 114
CALL w
LDI r6, 53
CALL w
LDI r6, 44
CALL w
LDI r6, 32
CALL w
LDI r6, 48
CALL w
LDI r6, 10
CALL w

; Write "LDI r2, 1"
LDI r6, 76
CALL w
LDI r6, 68
CALL w
LDI r6, 73
CALL w
LDI r6, 32
CALL w
LDI r6, 114
CALL w
LDI r6, 55
CALL w
LDI r6, 44
CALL w
LDI r6, 32
CALL w
LDI r6, 49
CALL w
LDI r6, 10
CALL w

; Write "LDI r4, W"
LDI r6, 76
CALL w
LDI r6, 68
CALL w
LDI r6, 73
CALL w
LDI r6, 32
CALL w
LDI r6, 114
CALL w
LDI r6, 56
CALL w
LDI r6, 44
CALL w
LDI r6, 32
CALL w
LDI r6, 87
CALL w
LDI r6, 10
CALL w

; Write "loop:"
LDI r6, 108
CALL w
LDI r6, 111
CALL w
LDI r6, 111
CALL w
LDI r6, 112
CALL w
LDI r6, 58
CALL w
LDI r6, 10
CALL w

; Write "  LDI r6, 0"
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 76
CALL w
LDI r6, 68
CALL w
LDI r6, 73
CALL w
LDI r6, 32
CALL w
LDI r6, 114
CALL w
LDI r6, 50
CALL w
LDI r6, 44
CALL w
LDI r6, 32
CALL w
LDI r6, 48
CALL w
LDI r6, 10
CALL w

; Write "  xloop:"
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 120
CALL w
LDI r6, 108
CALL w
LDI r6, 111
CALL w
LDI r6, 111
CALL w
LDI r6, 112
CALL w
LDI r6, 58
CALL w
LDI r6, 10
CALL w

; Write "    MOV r13, r8"
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 77
CALL w
LDI r6, 79
CALL w
LDI r6, 86
CALL w
LDI r6, 32
CALL w
LDI r6, 114
CALL w
LDI r6, 51
CALL w
LDI r6, 44
CALL w
LDI r6, 32
CALL w
LDI r6, 114
CALL w
LDI r6, 53
CALL w
LDI r6, 10
CALL w

; Write "    ADD r13, r6"
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 65
CALL w
LDI r6, 68
CALL w
LDI r6, 68
CALL w
LDI r6, 32
CALL w
LDI r6, 114
CALL w
LDI r6, 51
CALL w
LDI r6, 44
CALL w
LDI r6, 32
CALL w
LDI r6, 114
CALL w
LDI r6, 50
CALL w
LDI r6, 10
CALL w

; Write "    LDI r5, 255"
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 76
CALL w
LDI r6, 68
CALL w
LDI r6, 73
CALL w
LDI r6, 32
CALL w
LDI r6, 114
CALL w
LDI r6, 57
CALL w
LDI r6, 44
CALL w
LDI r6, 32
CALL w
LDI r6, 50
CALL w
LDI r6, 53
CALL w
LDI r6, 53
CALL w
LDI r6, 10
CALL w

; Write "    AND r13, r5"
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 65
CALL w
LDI r6, 78
CALL w
LDI r6, 68
CALL w
LDI r6, 32
CALL w
LDI r6, 114
CALL w
LDI r6, 51
CALL w
LDI r6, 44
CALL w
LDI r6, 32
CALL w
LDI r6, 114
CALL w
LDI r6, 57
CALL w
LDI r6, 10
CALL w

; Write "    PSET r6, r8, r13"
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 80
CALL w
LDI r6, 83
CALL w
LDI r6, 69
CALL w
LDI r6, 84
CALL w
LDI r6, 32
CALL w
LDI r6, 114
CALL w
LDI r6, 50
CALL w
LDI r6, 44
CALL w
LDI r6, 32
CALL w
LDI r6, 114
CALL w
LDI r6, 53
CALL w
LDI r6, 44
CALL w
LDI r6, 32
CALL w
LDI r6, 114
CALL w
LDI r6, 51
CALL w
LDI r6, 10
CALL w

; Write "    ADD r6, r2"
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 65
CALL w
LDI r6, 68
CALL w
LDI r6, 68
CALL w
LDI r6, 32
CALL w
LDI r6, 114
CALL w
LDI r6, 50
CALL w
LDI r6, 44
CALL w
LDI r6, 32
CALL w
LDI r6, 114
CALL w
LDI r6, 55
CALL w
LDI r6, 10
CALL w

; Write "    CMP r6, r4"
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 67
CALL w
LDI r6, 77
CALL w
LDI r6, 80
CALL w
LDI r6, 32
CALL w
LDI r6, 114
CALL w
LDI r6, 50
CALL w
LDI r6, 44
CALL w
LDI r6, 32
CALL w
LDI r6, 114
CALL w
LDI r6, 56
CALL w
LDI r6, 10
CALL w

; Write "    BLT r11, xloop"
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 66
CALL w
LDI r6, 76
CALL w
LDI r6, 84
CALL w
LDI r6, 32
CALL w
LDI r6, 114
CALL w
LDI r6, 48
CALL w
LDI r6, 44
CALL w
LDI r6, 32
CALL w
LDI r6, 120
CALL w
LDI r6, 108
CALL w
LDI r6, 111
CALL w
LDI r6, 111
CALL w
LDI r6, 112
CALL w
LDI r6, 10
CALL w

; Write "  ADD r8, r2"
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 65
CALL w
LDI r6, 68
CALL w
LDI r6, 68
CALL w
LDI r6, 32
CALL w
LDI r6, 114
CALL w
LDI r6, 53
CALL w
LDI r6, 44
CALL w
LDI r6, 32
CALL w
LDI r6, 114
CALL w
LDI r6, 55
CALL w
LDI r6, 10
CALL w

; Write "  CMP r8, r4"
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 67
CALL w
LDI r6, 77
CALL w
LDI r6, 80
CALL w
LDI r6, 32
CALL w
LDI r6, 114
CALL w
LDI r6, 53
CALL w
LDI r6, 44
CALL w
LDI r6, 32
CALL w
LDI r6, 114
CALL w
LDI r6, 56
CALL w
LDI r6, 10
CALL w

; Write "  BLT r11, loop"
LDI r6, 32
CALL w
LDI r6, 32
CALL w
LDI r6, 66
CALL w
LDI r6, 76
CALL w
LDI r6, 84
CALL w
LDI r6, 32
CALL w
LDI r6, 114
CALL w
LDI r6, 48
CALL w
LDI r6, 44
CALL w
LDI r6, 32
CALL w
LDI r6, 108
CALL w
LDI r6, 111
CALL w
LDI r6, 111
CALL w
LDI r6, 112
CALL w
LDI r6, 10
CALL w

; Write "HALT"
LDI r6, 72
CALL w
LDI r6, 65
CALL w
LDI r6, 76
CALL w
LDI r6, 84
CALL w
LDI r6, 10
CALL w

; Null-terminate the source text
LDI r6, 0
CALL w

; Assemble the source text
LDI r8, 0x0800
LDI r7, 0x1000
ASM r8, r7

; Check for assembly error
LDI r8, 0xFFD
LOAD r2, r8
LDI r4, 0xFFFFFFFF
CMP r2, r4
JZ r11, asm_error

; Run the compiled code at 0x1000
JMP 0x1000

asm_error:
    LDI r11, 0xFF0000
    FILL r11
    HALT

; ---- Subroutine: write character r6 at address in r0, advance r0 ----
w:
    STORE r0, r6
    LDI r13, 1
    ADD r0, r13
    RET
