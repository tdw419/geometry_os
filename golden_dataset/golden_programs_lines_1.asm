; DESCRIPTION: This GeOS assembly code draws a star burst of lines from the center of a 256x256 pixel grid to its corners and midpoints, using the LINE opcode (0x45) with a white color. The lines originate from the point (128, 128) and extend to the edges and corners of the grid.

; lines.asm -- draw a star burst of lines from center
; Uses LINE opcode (0x45)

; color: white
LDI r11, 0xFFFFFF

; center
LDI r10, 128
LDI r7, 128

; corners and edges to draw lines to
LDI r9, 0
LDI r5, 0
LINE r10, r7, r9, r5, r11

LDI r9, 255
LDI r5, 0
LINE r10, r7, r9, r5, r11

LDI r9, 255
LDI r5, 255
LINE r10, r7, r9, r5, r11

LDI r9, 0
LDI r5, 255
LINE r10, r7, r9, r5, r11

LDI r9, 128
LDI r5, 0
LINE r10, r7, r9, r5, r11

LDI r9, 255
LDI r5, 128
LINE r10, r7, r9, r5, r11

LDI r9, 128
LDI r5, 255
LINE r10, r7, r9, r5, r11

LDI r9, 0
LDI r5, 128
LINE r10, r7, r9, r5, r11

HALT
