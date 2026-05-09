; DESCRIPTION: Draws a yellow line from (125, 227) to (222, 74).
; PLAN: r0=125(x1), r1=227(y1), r2=222(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 227
LDI r2, 222
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
