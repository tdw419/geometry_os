; DESCRIPTION: Places a orange line segment connecting (351, 31) to (289, 217).
; PLAN: r0=351(x1), r1=31(y1), r2=289(x2), r3=217(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 31
LDI r2, 289
LDI r3, 217
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
