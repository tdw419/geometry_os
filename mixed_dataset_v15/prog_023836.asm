; DESCRIPTION: Places a orange line segment connecting (31, 108) to (478, 145).
; PLAN: r0=31(x1), r1=108(y1), r2=478(x2), r3=145(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 108
LDI r2, 478
LDI r3, 145
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
