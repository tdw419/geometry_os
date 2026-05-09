; DESCRIPTION: Places a yellow line segment connecting (77, 34) to (157, 168).
; PLAN: r0=77(x1), r1=34(y1), r2=157(x2), r3=168(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 34
LDI r2, 157
LDI r3, 168
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
