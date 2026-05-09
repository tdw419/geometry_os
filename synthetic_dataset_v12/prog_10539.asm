; DESCRIPTION: Places a orange line segment connecting (158, 83) to (427, 148).
; PLAN: r0=158(x1), r1=83(y1), r2=427(x2), r3=148(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 83
LDI r2, 427
LDI r3, 148
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
