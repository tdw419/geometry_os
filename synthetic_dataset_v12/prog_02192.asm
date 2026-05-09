; DESCRIPTION: Places a orange line segment connecting (14, 224) to (261, 199).
; PLAN: r0=14(x1), r1=224(y1), r2=261(x2), r3=199(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 224
LDI r2, 261
LDI r3, 199
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
