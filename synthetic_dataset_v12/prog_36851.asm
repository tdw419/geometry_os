; DESCRIPTION: Places a white line segment connecting (49, 1) to (163, 78).
; PLAN: r0=49(x1), r1=1(y1), r2=163(x2), r3=78(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 1
LDI r2, 163
LDI r3, 78
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
