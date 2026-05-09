; DESCRIPTION: Draws a yellow line from (163, 15) to (223, 123).
; PLAN: r0=163(x1), r1=15(y1), r2=223(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 15
LDI r2, 223
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
