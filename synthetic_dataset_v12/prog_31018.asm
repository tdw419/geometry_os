; DESCRIPTION: Renders a orange line between points (158, 198) and (54, 211).
; PLAN: r0=158(x1), r1=198(y1), r2=54(x2), r3=211(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 198
LDI r2, 54
LDI r3, 211
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
