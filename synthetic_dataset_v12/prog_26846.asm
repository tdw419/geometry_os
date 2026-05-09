; DESCRIPTION: Renders a orange line between points (88, 136) and (132, 157).
; PLAN: r0=88(x1), r1=136(y1), r2=132(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 136
LDI r2, 132
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
