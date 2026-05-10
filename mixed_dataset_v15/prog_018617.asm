; DESCRIPTION: Draws a red line from (312, 192) to (238, 36).
; PLAN: r0=312(x1), r1=192(y1), r2=238(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 192
LDI r2, 238
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
