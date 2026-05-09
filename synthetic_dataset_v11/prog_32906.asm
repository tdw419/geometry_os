; DESCRIPTION: Renders a orange line between points (93, 37) and (31, 73).
; PLAN: r0=93(x1), r1=37(y1), r2=31(x2), r3=73(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 37
LDI r2, 31
LDI r3, 73
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
