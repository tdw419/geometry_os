; DESCRIPTION: Places a yellow line segment connecting (382, 227) to (195, 97).
; PLAN: r0=382(x1), r1=227(y1), r2=195(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 227
LDI r2, 195
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
