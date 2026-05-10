; DESCRIPTION: Draws a red line from (101, 73) to (461, 252).
; PLAN: r0=101(x1), r1=73(y1), r2=461(x2), r3=252(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 73
LDI r2, 461
LDI r3, 252
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
