; DESCRIPTION: Draws a red line from (145, 29) to (389, 118).
; PLAN: r0=145(x1), r1=29(y1), r2=389(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 29
LDI r2, 389
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
