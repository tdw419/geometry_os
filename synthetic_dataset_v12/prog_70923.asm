; DESCRIPTION: Draws a red line from (448, 185) to (81, 157).
; PLAN: r0=448(x1), r1=185(y1), r2=81(x2), r3=157(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 185
LDI r2, 81
LDI r3, 157
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
