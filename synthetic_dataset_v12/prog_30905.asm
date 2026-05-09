; DESCRIPTION: Renders a red line between points (147, 92) and (155, 112).
; PLAN: r0=147(x1), r1=92(y1), r2=155(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 92
LDI r2, 155
LDI r3, 112
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
