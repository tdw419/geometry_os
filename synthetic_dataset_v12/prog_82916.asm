; DESCRIPTION: Places a orange line segment connecting (244, 48) to (442, 181).
; PLAN: r0=244(x1), r1=48(y1), r2=442(x2), r3=181(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 48
LDI r2, 442
LDI r3, 181
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
