; DESCRIPTION: Places a orange line segment connecting (76, 224) to (9, 181).
; PLAN: r0=76(x1), r1=224(y1), r2=9(x2), r3=181(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 224
LDI r2, 9
LDI r3, 181
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
