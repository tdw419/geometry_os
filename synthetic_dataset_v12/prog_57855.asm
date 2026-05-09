; DESCRIPTION: Places a red line segment connecting (341, 232) to (184, 147).
; PLAN: r0=341(x1), r1=232(y1), r2=184(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 232
LDI r2, 184
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
