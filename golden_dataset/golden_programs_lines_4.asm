; DESCRIPTION: Display a line using color white at the screen.

; lines.asm -- draw a star burst of lines from center
; Uses LINE opcode (0x45)

; color: white
LDI r11, 0xFFFFFF

; center
LDI r5, 128
LDI r12, 128

; corners and edges to draw lines to
LDI r9, 0
LDI r6, 0
LINE r5, r12, r9, r6, r11

LDI r9, 255
LDI r6, 0
LINE r5, r12, r9, r6, r11

LDI r9, 255
LDI r6, 255
LINE r5, r12, r9, r6, r11

LDI r9, 0
LDI r6, 255
LINE r5, r12, r9, r6, r11

LDI r9, 128
LDI r6, 0
LINE r5, r12, r9, r6, r11

LDI r9, 255
LDI r6, 128
LINE r5, r12, r9, r6, r11

LDI r9, 128
LDI r6, 255
LINE r5, r12, r9, r6, r11

LDI r9, 0
LDI r6, 128
LINE r5, r12, r9, r6, r11

HALT
