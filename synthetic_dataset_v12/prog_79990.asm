; DESCRIPTION: Draws a yellow line from (141, 232) to (457, 4).
; PLAN: r0=141(x1), r1=232(y1), r2=457(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 232
LDI r2, 457
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
