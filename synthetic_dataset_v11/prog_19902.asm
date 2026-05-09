; DESCRIPTION: Draws a yellow line from (41, 165) to (147, 60).
; PLAN: r0=41(x1), r1=165(y1), r2=147(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 165
LDI r2, 147
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
