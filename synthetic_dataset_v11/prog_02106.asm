; DESCRIPTION: Renders a orange line between points (155, 88) and (246, 90).
; PLAN: r0=155(x1), r1=88(y1), r2=246(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 88
LDI r2, 246
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
