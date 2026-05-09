; DESCRIPTION: Renders a orange line between points (94, 136) and (66, 123).
; PLAN: r0=94(x1), r1=136(y1), r2=66(x2), r3=123(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 136
LDI r2, 66
LDI r3, 123
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
