; DESCRIPTION: Places a orange line segment connecting (138, 224) to (9, 184).
; PLAN: r0=138(x1), r1=224(y1), r2=9(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 224
LDI r2, 9
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
