; DESCRIPTION: Places a yellow line segment connecting (402, 26) to (52, 147).
; PLAN: r0=402(x1), r1=26(y1), r2=52(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 26
LDI r2, 52
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
