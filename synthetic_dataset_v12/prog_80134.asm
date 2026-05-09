; DESCRIPTION: Draws a red line from (336, 53) to (9, 106).
; PLAN: r0=336(x1), r1=53(y1), r2=9(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 53
LDI r2, 9
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
