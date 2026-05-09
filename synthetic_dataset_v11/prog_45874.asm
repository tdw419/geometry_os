; DESCRIPTION: Draws a red line from (147, 75) to (179, 100).
; PLAN: r0=147(x1), r1=75(y1), r2=179(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 75
LDI r2, 179
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
