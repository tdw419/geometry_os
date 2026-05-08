; DESCRIPTION: This GeOS assembly code draws a star burst of lines from the center of a 256x256 pixel grid to its corners and midpoints, using the LINE opcode (0x45) with a white color. The lines originate from the point (128, 128) and extend to the edges and corners of the grid.

; lines.asm -- draw a star burst of lines from center
; Uses LINE opcode (0x45)

; color: white
LDI r11, 0xFFFFFF

; center
LDI r2, 128
LDI r9, 128

; corners and edges to draw lines to
LDI r10, 0
LDI r1, 0
LINE r2, r9, r10, r1, r11

LDI r10, 255
LDI r1, 0
LINE r2, r9, r10, r1, r11

LDI r10, 255
LDI r1, 255
LINE r2, r9, r10, r1, r11

LDI r10, 0
LDI r1, 255
LINE r2, r9, r10, r1, r11

LDI r10, 128
LDI r1, 0
LINE r2, r9, r10, r1, r11

LDI r10, 255
LDI r1, 128
LINE r2, r9, r10, r1, r11

LDI r10, 128
LDI r1, 255
LINE r2, r9, r10, r1, r11

LDI r10, 0
LDI r1, 128
LINE r2, r9, r10, r1, r11

HALT
