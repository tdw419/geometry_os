; DESCRIPTION: Places a orange line segment connecting (76, 205) to (248, 224).
; PLAN: r0=76(x1), r1=205(y1), r2=248(x2), r3=224(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 205
LDI r2, 248
LDI r3, 224
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
