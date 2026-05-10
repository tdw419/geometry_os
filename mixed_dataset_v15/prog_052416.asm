; DESCRIPTION: Places a green line segment connecting (163, 34) to (297, 163).
; PLAN: r0=163(x1), r1=34(y1), r2=297(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 34
LDI r2, 297
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
