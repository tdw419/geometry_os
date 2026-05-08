; DESCRIPTION: A white line centered at the screen with fixed size.

; lines.asm -- draw a star burst of lines from center
; Uses LINE opcode (0x45)

; color: white
LDI r11, 0xFFFFFF

; center
LDI r13, 128
LDI r12, 128

; corners and edges to draw lines to
LDI r14, 0
LDI r9, 0
LINE r13, r12, r14, r9, r11

LDI r14, 255
LDI r9, 0
LINE r13, r12, r14, r9, r11

LDI r14, 255
LDI r9, 255
LINE r13, r12, r14, r9, r11

LDI r14, 0
LDI r9, 255
LINE r13, r12, r14, r9, r11

LDI r14, 128
LDI r9, 0
LINE r13, r12, r14, r9, r11

LDI r14, 255
LDI r9, 128
LINE r13, r12, r14, r9, r11

LDI r14, 128
LDI r9, 255
LINE r13, r12, r14, r9, r11

LDI r14, 0
LDI r9, 128
LINE r13, r12, r14, r9, r11

HALT
