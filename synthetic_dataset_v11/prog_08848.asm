; DESCRIPTION: Renders a orange line between points (158, 73) and (225, 158).
; PLAN: r0=158(x1), r1=73(y1), r2=225(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 73
LDI r2, 225
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
