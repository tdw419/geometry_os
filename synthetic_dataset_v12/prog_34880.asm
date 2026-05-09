; DESCRIPTION: Places a orange line segment connecting (163, 250) to (308, 12).
; PLAN: r0=163(x1), r1=250(y1), r2=308(x2), r3=12(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 250
LDI r2, 308
LDI r3, 12
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
