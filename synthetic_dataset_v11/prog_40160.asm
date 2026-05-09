; DESCRIPTION: Draws a red line from (55, 158) to (25, 95).
; PLAN: r0=55(x1), r1=158(y1), r2=25(x2), r3=95(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 158
LDI r2, 25
LDI r3, 95
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
