; DESCRIPTION: Draws a orange line from (58, 147) to (472, 32).
; PLAN: r0=58(x1), r1=147(y1), r2=472(x2), r3=32(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 147
LDI r2, 472
LDI r3, 32
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
