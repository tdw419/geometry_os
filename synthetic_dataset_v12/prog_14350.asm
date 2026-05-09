; DESCRIPTION: Renders a orange line between points (158, 162) and (274, 240).
; PLAN: r0=158(x1), r1=162(y1), r2=274(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 162
LDI r2, 274
LDI r3, 240
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
