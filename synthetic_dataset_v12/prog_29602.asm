; DESCRIPTION: Renders a red line between points (357, 175) and (343, 139).
; PLAN: r0=357(x1), r1=175(y1), r2=343(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 175
LDI r2, 343
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
