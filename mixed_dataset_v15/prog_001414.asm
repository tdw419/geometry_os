; DESCRIPTION: Draws a green line from (41, 147) to (385, 106).
; PLAN: r0=41(x1), r1=147(y1), r2=385(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 147
LDI r2, 385
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
