; DESCRIPTION: Places a orange line segment connecting (12, 199) to (122, 31).
; PLAN: r0=12(x1), r1=199(y1), r2=122(x2), r3=31(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 199
LDI r2, 122
LDI r3, 31
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
