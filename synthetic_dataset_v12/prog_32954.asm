; DESCRIPTION: Places a orange line segment connecting (31, 101) to (47, 249).
; PLAN: r0=31(x1), r1=101(y1), r2=47(x2), r3=249(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 101
LDI r2, 47
LDI r3, 249
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
