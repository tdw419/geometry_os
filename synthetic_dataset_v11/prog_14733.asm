; DESCRIPTION: Places a blue line segment connecting (41, 165) to (147, 156).
; PLAN: r0=41(x1), r1=165(y1), r2=147(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 165
LDI r2, 147
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
