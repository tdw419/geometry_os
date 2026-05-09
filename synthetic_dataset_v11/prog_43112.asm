; DESCRIPTION: Draws a red line from (148, 198) to (184, 139).
; PLAN: r0=148(x1), r1=198(y1), r2=184(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 198
LDI r2, 184
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
