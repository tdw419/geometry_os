; DESCRIPTION: Draws a yellow line from (188, 227) to (324, 14).
; PLAN: r0=188(x1), r1=227(y1), r2=324(x2), r3=14(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 227
LDI r2, 324
LDI r3, 14
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
