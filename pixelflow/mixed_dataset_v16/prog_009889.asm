; DESCRIPTION: Places a orange line segment connecting (179, 94) to (339, 119).
; PLAN: r0=179(x1), r1=94(y1), r2=339(x2), r3=119(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 94
LDI r2, 339
LDI r3, 119
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
