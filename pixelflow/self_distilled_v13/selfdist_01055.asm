; DESCRIPTION: Renders a yellow line segment connecting (343, 82) to (31, 118).
; PLAN: r0=343(x1), r1=82(y1), r2=31(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 82
LDI r2, 31
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
