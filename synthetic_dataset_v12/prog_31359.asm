; DESCRIPTION: Places a orange line segment connecting (374, 157) to (49, 232).
; PLAN: r0=374(x1), r1=157(y1), r2=49(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 157
LDI r2, 49
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
