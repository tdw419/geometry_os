; DESCRIPTION: Draws a red line from (484, 139) to (211, 121).
; PLAN: r0=484(x1), r1=139(y1), r2=211(x2), r3=121(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 139
LDI r2, 211
LDI r3, 121
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
