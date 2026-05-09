; DESCRIPTION: Places a black line segment connecting (134, 245) to (163, 54).
; PLAN: r0=134(x1), r1=245(y1), r2=163(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 245
LDI r2, 163
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
