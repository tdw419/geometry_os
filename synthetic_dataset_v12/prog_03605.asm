; DESCRIPTION: Draws a yellow line from (147, 123) to (104, 121).
; PLAN: r0=147(x1), r1=123(y1), r2=104(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 123
LDI r2, 104
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
