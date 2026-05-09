; DESCRIPTION: Draws a yellow line from (200, 174) to (222, 20).
; PLAN: r0=200(x1), r1=174(y1), r2=222(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 174
LDI r2, 222
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
