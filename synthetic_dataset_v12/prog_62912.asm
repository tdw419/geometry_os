; DESCRIPTION: Places a yellow line segment connecting (204, 79) to (144, 97).
; PLAN: r0=204(x1), r1=79(y1), r2=144(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 79
LDI r2, 144
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
