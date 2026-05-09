; DESCRIPTION: Renders a red line between points (85, 88) and (155, 70).
; PLAN: r0=85(x1), r1=88(y1), r2=155(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 88
LDI r2, 155
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
