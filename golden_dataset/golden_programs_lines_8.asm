; DESCRIPTION: This GeOS assembly code draws a star burst of lines from the center of a 256x256 pixel grid to its corners and midpoints, using the LINE opcode (0x45) with a white color. The lines originate from the point (128, 128) and extend to the edges and corners of the grid.

; lines.asm -- draw a star burst of lines from center
; Uses LINE opcode (0x45)

; color: white
LDI r14, 0xFFFFFF

; center
LDI r5, 128
LDI r9, 128

; corners and edges to draw lines to
LDI r8, 0
LDI r15, 0
LINE r5, r9, r8, r15, r14

LDI r8, 255
LDI r15, 0
LINE r5, r9, r8, r15, r14

LDI r8, 255
LDI r15, 255
LINE r5, r9, r8, r15, r14

LDI r8, 0
LDI r15, 255
LINE r5, r9, r8, r15, r14

LDI r8, 128
LDI r15, 0
LINE r5, r9, r8, r15, r14

LDI r8, 255
LDI r15, 128
LINE r5, r9, r8, r15, r14

LDI r8, 128
LDI r15, 255
LINE r5, r9, r8, r15, r14

LDI r8, 0
LDI r15, 128
LINE r5, r9, r8, r15, r14

HALT
