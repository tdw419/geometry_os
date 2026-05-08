; DESCRIPTION: This GeOS assembly code draws a star burst of lines from the center of a 256x256 pixel grid to its corners and midpoints, using the LINE opcode (0x45) with a white color. The lines originate from the point (128, 128) and extend to the edges and corners of the grid.

; lines.asm -- draw a star burst of lines from center
; Uses LINE opcode (0x45)

; color: white
LDI r0, 0xFFFFFF

; center
LDI r8, 128
LDI r14, 128

; corners and edges to draw lines to
LDI r4, 0
LDI r7, 0
LINE r8, r14, r4, r7, r0

LDI r4, 255
LDI r7, 0
LINE r8, r14, r4, r7, r0

LDI r4, 255
LDI r7, 255
LINE r8, r14, r4, r7, r0

LDI r4, 0
LDI r7, 255
LINE r8, r14, r4, r7, r0

LDI r4, 128
LDI r7, 0
LINE r8, r14, r4, r7, r0

LDI r4, 255
LDI r7, 128
LINE r8, r14, r4, r7, r0

LDI r4, 128
LDI r7, 255
LINE r8, r14, r4, r7, r0

LDI r4, 0
LDI r7, 128
LINE r8, r14, r4, r7, r0

HALT
