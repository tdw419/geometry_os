; DESCRIPTION: Places a orange line segment connecting (349, 172) to (227, 118).
; PLAN: r0=349(x1), r1=172(y1), r2=227(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 172
LDI r2, 227
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
