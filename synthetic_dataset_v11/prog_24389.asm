; DESCRIPTION: Renders a purple line between points (23, 85) and (51, 92).
; PLAN: r0=23(x1), r1=85(y1), r2=51(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 85
LDI r2, 51
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
