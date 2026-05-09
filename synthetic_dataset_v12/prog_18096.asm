; DESCRIPTION: Draws a red line from (358, 136) to (145, 18).
; PLAN: r0=358(x1), r1=136(y1), r2=145(x2), r3=18(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 136
LDI r2, 145
LDI r3, 18
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
