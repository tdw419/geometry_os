; DESCRIPTION: Draws a yellow line from (472, 184) to (194, 15).
; PLAN: r0=472(x1), r1=184(y1), r2=194(x2), r3=15(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 184
LDI r2, 194
LDI r3, 15
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
