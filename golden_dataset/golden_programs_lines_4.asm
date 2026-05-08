; DESCRIPTION: This GeOS assembly code draws a star burst of lines from the center of a 256x256 pixel grid to its corners and midpoints, using the LINE opcode (0x45) with a white color. The lines originate from the point (128, 128) and extend to the edges and corners of the grid.

; lines.asm -- draw a star burst of lines from center
; Uses LINE opcode (0x45)

; color: white
LDI r8, 0xFFFFFF

; center
LDI r12, 128
LDI r0, 128

; corners and edges to draw lines to
LDI r14, 0
LDI r10, 0
LINE r12, r0, r14, r10, r8

LDI r14, 255
LDI r10, 0
LINE r12, r0, r14, r10, r8

LDI r14, 255
LDI r10, 255
LINE r12, r0, r14, r10, r8

LDI r14, 0
LDI r10, 255
LINE r12, r0, r14, r10, r8

LDI r14, 128
LDI r10, 0
LINE r12, r0, r14, r10, r8

LDI r14, 255
LDI r10, 128
LINE r12, r0, r14, r10, r8

LDI r14, 128
LDI r10, 255
LINE r12, r0, r14, r10, r8

LDI r14, 0
LDI r10, 128
LINE r12, r0, r14, r10, r8

HALT
