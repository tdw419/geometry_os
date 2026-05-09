; DESCRIPTION: Renders a red line between points (155, 185) and (105, 205).
; PLAN: r0=155(x1), r1=185(y1), r2=105(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 185
LDI r2, 105
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
