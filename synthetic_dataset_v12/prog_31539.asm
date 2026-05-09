; DESCRIPTION: Draws a red line from (15, 185) to (61, 194).
; PLAN: r0=15(x1), r1=185(y1), r2=61(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 185
LDI r2, 61
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
