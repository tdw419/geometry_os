; DESCRIPTION: Renders a red line between points (361, 217) and (336, 2).
; PLAN: r0=361(x1), r1=217(y1), r2=336(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 217
LDI r2, 336
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
