; DESCRIPTION: Places a yellow line segment connecting (81, 68) to (157, 211).
; PLAN: r0=81(x1), r1=68(y1), r2=157(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 68
LDI r2, 157
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
