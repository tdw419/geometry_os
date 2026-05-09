; DESCRIPTION: Places a green line segment connecting (139, 183) to (97, 100).
; PLAN: r0=139(x1), r1=183(y1), r2=97(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 183
LDI r2, 97
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
