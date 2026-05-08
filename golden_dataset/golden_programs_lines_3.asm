; DESCRIPTION: This GeOS assembly code draws a star burst of lines from the center of a 256x256 pixel grid to its corners and midpoints, using the LINE opcode (0x45) with a white color. The lines originate from the point (128, 128) and extend to the edges and corners of the grid.

; lines.asm -- draw a star burst of lines from center
; Uses LINE opcode (0x45)

; color: white
LDI r6, 0xFFFFFF

; center
LDI r7, 128
LDI r8, 128

; corners and edges to draw lines to
LDI r9, 0
LDI r11, 0
LINE r7, r8, r9, r11, r6

LDI r9, 255
LDI r11, 0
LINE r7, r8, r9, r11, r6

LDI r9, 255
LDI r11, 255
LINE r7, r8, r9, r11, r6

LDI r9, 0
LDI r11, 255
LINE r7, r8, r9, r11, r6

LDI r9, 128
LDI r11, 0
LINE r7, r8, r9, r11, r6

LDI r9, 255
LDI r11, 128
LINE r7, r8, r9, r11, r6

LDI r9, 128
LDI r11, 255
LINE r7, r8, r9, r11, r6

LDI r9, 0
LDI r11, 128
LINE r7, r8, r9, r11, r6

HALT
