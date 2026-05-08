; DESCRIPTION: Geometry OS program to draw a white line.

; lines.asm -- draw a star burst of lines from center
; Uses LINE opcode (0x45)

; color: white
LDI r5, 0xFFFFFF

; center
LDI r15, 128
LDI r1, 128

; corners and edges to draw lines to
LDI r14, 0
LDI r10, 0
LINE r15, r1, r14, r10, r5

LDI r14, 255
LDI r10, 0
LINE r15, r1, r14, r10, r5

LDI r14, 255
LDI r10, 255
LINE r15, r1, r14, r10, r5

LDI r14, 0
LDI r10, 255
LINE r15, r1, r14, r10, r5

LDI r14, 128
LDI r10, 0
LINE r15, r1, r14, r10, r5

LDI r14, 255
LDI r10, 128
LINE r15, r1, r14, r10, r5

LDI r14, 128
LDI r10, 255
LINE r15, r1, r14, r10, r5

LDI r14, 0
LDI r10, 128
LINE r15, r1, r14, r10, r5

HALT
