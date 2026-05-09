; DESCRIPTION: Places a orange line segment connecting (20, 89) to (93, 17).
; PLAN: r0=20(x1), r1=89(y1), r2=93(x2), r3=17(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 89
LDI r2, 93
LDI r3, 17
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
