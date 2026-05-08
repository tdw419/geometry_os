; DESCRIPTION: A white line centered at the screen with fixed size.

; lines.asm -- draw a star burst of lines from center
; Uses LINE opcode (0x45)

; color: white
LDI r0, 0xFFFFFF

; center
LDI r5, 128
LDI r1, 128

; corners and edges to draw lines to
LDI r12, 0
LDI r11, 0
LINE r5, r1, r12, r11, r0

LDI r12, 255
LDI r11, 0
LINE r5, r1, r12, r11, r0

LDI r12, 255
LDI r11, 255
LINE r5, r1, r12, r11, r0

LDI r12, 0
LDI r11, 255
LINE r5, r1, r12, r11, r0

LDI r12, 128
LDI r11, 0
LINE r5, r1, r12, r11, r0

LDI r12, 255
LDI r11, 128
LINE r5, r1, r12, r11, r0

LDI r12, 128
LDI r11, 255
LINE r5, r1, r12, r11, r0

LDI r12, 0
LDI r11, 128
LINE r5, r1, r12, r11, r0

HALT
