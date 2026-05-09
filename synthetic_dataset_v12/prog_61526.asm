; DESCRIPTION: Places a white line segment connecting (29, 85) to (163, 56).
; PLAN: r0=29(x1), r1=85(y1), r2=163(x2), r3=56(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 85
LDI r2, 163
LDI r3, 56
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
