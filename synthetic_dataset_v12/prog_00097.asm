; DESCRIPTION: Places a yellow line segment connecting (308, 147) to (155, 88).
; PLAN: r0=308(x1), r1=147(y1), r2=155(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 147
LDI r2, 155
LDI r3, 88
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
