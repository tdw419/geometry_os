; DESCRIPTION: Draws a red line from (158, 172) to (95, 10).
; PLAN: r0=158(x1), r1=172(y1), r2=95(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 172
LDI r2, 95
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
