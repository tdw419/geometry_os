; DESCRIPTION: Draws a yellow line from (55, 227) to (184, 255).
; PLAN: r0=55(x1), r1=227(y1), r2=184(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 227
LDI r2, 184
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
