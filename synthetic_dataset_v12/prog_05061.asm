; DESCRIPTION: Renders a orange line between points (192, 118) and (507, 47).
; PLAN: r0=192(x1), r1=118(y1), r2=507(x2), r3=47(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 118
LDI r2, 507
LDI r3, 47
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
