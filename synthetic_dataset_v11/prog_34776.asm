; DESCRIPTION: Places a orange line segment connecting (49, 170) to (122, 94).
; PLAN: r0=49(x1), r1=170(y1), r2=122(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 170
LDI r2, 122
LDI r3, 94
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
