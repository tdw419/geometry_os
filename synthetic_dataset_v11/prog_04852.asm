; DESCRIPTION: Places a purple line segment connecting (6, 105) to (204, 78).
; PLAN: r0=6(x1), r1=105(y1), r2=204(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 105
LDI r2, 204
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
