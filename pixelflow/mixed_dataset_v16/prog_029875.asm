; DESCRIPTION: Draws a red line from (358, 118) to (170, 72).
; PLAN: r0=358(x1), r1=118(y1), r2=170(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 118
LDI r2, 170
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
