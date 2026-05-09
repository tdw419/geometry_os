; DESCRIPTION: Places a orange line segment connecting (244, 163) to (321, 233).
; PLAN: r0=244(x1), r1=163(y1), r2=321(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 163
LDI r2, 321
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
