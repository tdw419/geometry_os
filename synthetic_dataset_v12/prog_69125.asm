; DESCRIPTION: Places a green line segment connecting (34, 145) to (163, 148).
; PLAN: r0=34(x1), r1=145(y1), r2=163(x2), r3=148(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 145
LDI r2, 163
LDI r3, 148
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
