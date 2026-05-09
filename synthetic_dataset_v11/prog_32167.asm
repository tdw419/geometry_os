; DESCRIPTION: Renders a orange line between points (93, 20) and (188, 208).
; PLAN: r0=93(x1), r1=20(y1), r2=188(x2), r3=208(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 20
LDI r2, 188
LDI r3, 208
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
