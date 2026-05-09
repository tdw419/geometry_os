; DESCRIPTION: Draws a red line from (456, 179) to (453, 47).
; PLAN: r0=456(x1), r1=179(y1), r2=453(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 179
LDI r2, 453
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
