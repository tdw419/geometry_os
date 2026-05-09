; DESCRIPTION: Places a orange line segment connecting (8, 61) to (222, 244).
; PLAN: r0=8(x1), r1=61(y1), r2=222(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 61
LDI r2, 222
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
