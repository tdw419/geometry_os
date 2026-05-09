; DESCRIPTION: Draws a red line from (318, 89) to (92, 191).
; PLAN: r0=318(x1), r1=89(y1), r2=92(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 89
LDI r2, 92
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
