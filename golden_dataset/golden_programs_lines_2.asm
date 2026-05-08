; DESCRIPTION: This GeOS assembly code draws a star burst of lines from the center of a 256x256 pixel grid to its corners and midpoints, using the LINE opcode (0x45) with a white color. The lines originate from the point (128, 128) and extend to the edges and corners of the grid.

; lines.asm -- draw a star burst of lines from center
; Uses LINE opcode (0x45)

; color: white
LDI r14, 0xFFFFFF

; center
LDI r1, 128
LDI r4, 128

; corners and edges to draw lines to
LDI r11, 0
LDI r0, 0
LINE r1, r4, r11, r0, r14

LDI r11, 255
LDI r0, 0
LINE r1, r4, r11, r0, r14

LDI r11, 255
LDI r0, 255
LINE r1, r4, r11, r0, r14

LDI r11, 0
LDI r0, 255
LINE r1, r4, r11, r0, r14

LDI r11, 128
LDI r0, 0
LINE r1, r4, r11, r0, r14

LDI r11, 255
LDI r0, 128
LINE r1, r4, r11, r0, r14

LDI r11, 128
LDI r0, 255
LINE r1, r4, r11, r0, r14

LDI r11, 0
LDI r0, 128
LINE r1, r4, r11, r0, r14

HALT
