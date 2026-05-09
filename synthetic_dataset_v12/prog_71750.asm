; DESCRIPTION: Renders a red line between points (399, 105) and (378, 116).
; PLAN: r0=399(x1), r1=105(y1), r2=378(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 105
LDI r2, 378
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
