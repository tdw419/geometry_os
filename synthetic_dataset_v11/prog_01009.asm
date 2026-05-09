; DESCRIPTION: Renders a orange line between points (95, 141) and (158, 17).
; PLAN: r0=95(x1), r1=141(y1), r2=158(x2), r3=17(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 141
LDI r2, 158
LDI r3, 17
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
