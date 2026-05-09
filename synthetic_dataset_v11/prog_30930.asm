; DESCRIPTION: Draws a red line from (81, 95) to (142, 185).
; PLAN: r0=81(x1), r1=95(y1), r2=142(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 95
LDI r2, 142
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
