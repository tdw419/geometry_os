; DESCRIPTION: Render a white line at the screen.

; lines.asm -- draw a star burst of lines from center
; Uses LINE opcode (0x45)

; color: white
LDI r5, 0xFFFFFF

; center
LDI r3, 128
LDI r0, 128

; corners and edges to draw lines to
LDI r9, 0
LDI r14, 0
LINE r3, r0, r9, r14, r5

LDI r9, 255
LDI r14, 0
LINE r3, r0, r9, r14, r5

LDI r9, 255
LDI r14, 255
LINE r3, r0, r9, r14, r5

LDI r9, 0
LDI r14, 255
LINE r3, r0, r9, r14, r5

LDI r9, 128
LDI r14, 0
LINE r3, r0, r9, r14, r5

LDI r9, 255
LDI r14, 128
LINE r3, r0, r9, r14, r5

LDI r9, 128
LDI r14, 255
LINE r3, r0, r9, r14, r5

LDI r9, 0
LDI r14, 128
LINE r3, r0, r9, r14, r5

HALT
