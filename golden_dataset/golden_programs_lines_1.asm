; DESCRIPTION: Draw line: pos=the screen, color=white, size=fixed size.

; lines.asm -- draw a star burst of lines from center
; Uses LINE opcode (0x45)

; color: white
LDI r3, 0xFFFFFF

; center
LDI r8, 128
LDI r4, 128

; corners and edges to draw lines to
LDI r15, 0
LDI r12, 0
LINE r8, r4, r15, r12, r3

LDI r15, 255
LDI r12, 0
LINE r8, r4, r15, r12, r3

LDI r15, 255
LDI r12, 255
LINE r8, r4, r15, r12, r3

LDI r15, 0
LDI r12, 255
LINE r8, r4, r15, r12, r3

LDI r15, 128
LDI r12, 0
LINE r8, r4, r15, r12, r3

LDI r15, 255
LDI r12, 128
LINE r8, r4, r15, r12, r3

LDI r15, 128
LDI r12, 255
LINE r8, r4, r15, r12, r3

LDI r15, 0
LDI r12, 128
LINE r8, r4, r15, r12, r3

HALT
