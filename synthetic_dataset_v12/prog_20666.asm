; DESCRIPTION: Renders a red line between points (432, 101) and (92, 15).
; PLAN: r0=432(x1), r1=101(y1), r2=92(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 101
LDI r2, 92
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
