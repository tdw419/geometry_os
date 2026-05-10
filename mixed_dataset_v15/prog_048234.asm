; DESCRIPTION: Places a orange line segment connecting (104, 170) to (195, 211).
; PLAN: r0=104(x1), r1=170(y1), r2=195(x2), r3=211(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 170
LDI r2, 195
LDI r3, 211
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
