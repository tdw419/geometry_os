; DESCRIPTION: Renders a orange line between points (57, 182) and (51, 199).
; PLAN: r0=57(x1), r1=182(y1), r2=51(x2), r3=199(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 182
LDI r2, 51
LDI r3, 199
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
