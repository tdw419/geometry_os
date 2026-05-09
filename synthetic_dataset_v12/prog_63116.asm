; DESCRIPTION: Draws a orange line from (158, 94) to (339, 85).
; PLAN: r0=158(x1), r1=94(y1), r2=339(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 94
LDI r2, 339
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
