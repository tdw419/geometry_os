; DESCRIPTION: Renders a orange line between points (266, 190) and (399, 115).
; PLAN: r0=266(x1), r1=190(y1), r2=399(x2), r3=115(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 190
LDI r2, 399
LDI r3, 115
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
