; DESCRIPTION: Renders a purple line between points (486, 92) and (459, 149).
; PLAN: r0=486(x1), r1=92(y1), r2=459(x2), r3=149(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 92
LDI r2, 459
LDI r3, 149
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
