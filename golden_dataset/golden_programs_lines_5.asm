; DESCRIPTION: A white line centered at the screen with fixed size.

; lines.asm -- draw a star burst of lines from center
; Uses LINE opcode (0x45)

; color: white
LDI r6, 0xFFFFFF

; center
LDI r11, 128
LDI r5, 128

; corners and edges to draw lines to
LDI r13, 0
LDI r15, 0
LINE r11, r5, r13, r15, r6

LDI r13, 255
LDI r15, 0
LINE r11, r5, r13, r15, r6

LDI r13, 255
LDI r15, 255
LINE r11, r5, r13, r15, r6

LDI r13, 0
LDI r15, 255
LINE r11, r5, r13, r15, r6

LDI r13, 128
LDI r15, 0
LINE r11, r5, r13, r15, r6

LDI r13, 255
LDI r15, 128
LINE r11, r5, r13, r15, r6

LDI r13, 128
LDI r15, 255
LINE r11, r5, r13, r15, r6

LDI r13, 0
LDI r15, 128
LINE r11, r5, r13, r15, r6

HALT
