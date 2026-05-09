; DESCRIPTION: Renders a orange line between points (141, 182) and (250, 18).
; PLAN: r0=141(x1), r1=182(y1), r2=250(x2), r3=18(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 182
LDI r2, 250
LDI r3, 18
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
