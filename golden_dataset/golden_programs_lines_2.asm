; DESCRIPTION: A white line centered at the screen with fixed size.

; lines.asm -- draw a star burst of lines from center
; Uses LINE opcode (0x45)

; color: white
LDI r7, 0xFFFFFF

; center
LDI r8, 128
LDI r12, 128

; corners and edges to draw lines to
LDI r6, 0
LDI r4, 0
LINE r8, r12, r6, r4, r7

LDI r6, 255
LDI r4, 0
LINE r8, r12, r6, r4, r7

LDI r6, 255
LDI r4, 255
LINE r8, r12, r6, r4, r7

LDI r6, 0
LDI r4, 255
LINE r8, r12, r6, r4, r7

LDI r6, 128
LDI r4, 0
LINE r8, r12, r6, r4, r7

LDI r6, 255
LDI r4, 128
LINE r8, r12, r6, r4, r7

LDI r6, 128
LDI r4, 255
LINE r8, r12, r6, r4, r7

LDI r6, 0
LDI r4, 128
LINE r8, r12, r6, r4, r7

HALT
