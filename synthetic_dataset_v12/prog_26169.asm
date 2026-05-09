; DESCRIPTION: Places a yellow line segment connecting (24, 64) to (140, 97).
; PLAN: r0=24(x1), r1=64(y1), r2=140(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 64
LDI r2, 140
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
