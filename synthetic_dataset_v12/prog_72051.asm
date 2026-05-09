; DESCRIPTION: Places a orange line segment connecting (244, 49) to (275, 73).
; PLAN: r0=244(x1), r1=49(y1), r2=275(x2), r3=73(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 49
LDI r2, 275
LDI r3, 73
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
