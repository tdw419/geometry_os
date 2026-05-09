; DESCRIPTION: Places a orange line segment connecting (471, 98) to (16, 217).
; PLAN: r0=471(x1), r1=98(y1), r2=16(x2), r3=217(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 98
LDI r2, 16
LDI r3, 217
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
