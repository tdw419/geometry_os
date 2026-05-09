; DESCRIPTION: Draws a red line from (97, 117) to (456, 169).
; PLAN: r0=97(x1), r1=117(y1), r2=456(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 117
LDI r2, 456
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
