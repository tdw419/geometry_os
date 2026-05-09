; DESCRIPTION: Places a orange line segment connecting (471, 81) to (321, 97).
; PLAN: r0=471(x1), r1=81(y1), r2=321(x2), r3=97(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 81
LDI r2, 321
LDI r3, 97
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
