; DESCRIPTION: Places a yellow line segment connecting (226, 24) to (157, 130).
; PLAN: r0=226(x1), r1=24(y1), r2=157(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 24
LDI r2, 157
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
