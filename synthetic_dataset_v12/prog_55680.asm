; DESCRIPTION: Places a orange line segment connecting (300, 244) to (163, 252).
; PLAN: r0=300(x1), r1=244(y1), r2=163(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 244
LDI r2, 163
LDI r3, 252
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
