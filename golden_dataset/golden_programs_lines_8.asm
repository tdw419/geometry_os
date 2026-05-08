; DESCRIPTION: Draws a white line at the screen with fixed size.

; lines.asm -- draw a star burst of lines from center
; Uses LINE opcode (0x45)

; color: white
LDI r10, 0xFFFFFF

; center
LDI r11, 128
LDI r5, 128

; corners and edges to draw lines to
LDI r1, 0
LDI r12, 0
LINE r11, r5, r1, r12, r10

LDI r1, 255
LDI r12, 0
LINE r11, r5, r1, r12, r10

LDI r1, 255
LDI r12, 255
LINE r11, r5, r1, r12, r10

LDI r1, 0
LDI r12, 255
LINE r11, r5, r1, r12, r10

LDI r1, 128
LDI r12, 0
LINE r11, r5, r1, r12, r10

LDI r1, 255
LDI r12, 128
LINE r11, r5, r1, r12, r10

LDI r1, 128
LDI r12, 255
LINE r11, r5, r1, r12, r10

LDI r1, 0
LDI r12, 128
LINE r11, r5, r1, r12, r10

HALT
