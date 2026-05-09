; DESCRIPTION: Draws a red line from (232, 227) to (204, 204).
; PLAN: r0=232(x1), r1=227(y1), r2=204(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 227
LDI r2, 204
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
