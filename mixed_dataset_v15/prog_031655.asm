; DESCRIPTION: Places a orange line segment connecting (338, 121) to (471, 130).
; PLAN: r0=338(x1), r1=121(y1), r2=471(x2), r3=130(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 121
LDI r2, 471
LDI r3, 130
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
