; DESCRIPTION: Draws a yellow line from (282, 104) to (355, 163).
; PLAN: r0=282(x1), r1=104(y1), r2=355(x2), r3=163(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 104
LDI r2, 355
LDI r3, 163
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
