; DESCRIPTION: Draws a red line from (11, 164) to (100, 116).
; PLAN: r0=11(x1), r1=164(y1), r2=100(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 164
LDI r2, 100
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
