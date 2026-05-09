; DESCRIPTION: Places a orange line segment connecting (274, 122) to (508, 58).
; PLAN: r0=274(x1), r1=122(y1), r2=508(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 122
LDI r2, 508
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
