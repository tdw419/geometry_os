; DESCRIPTION: Places a yellow line segment connecting (147, 167) to (88, 22).
; PLAN: r0=147(x1), r1=167(y1), r2=88(x2), r3=22(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 167
LDI r2, 88
LDI r3, 22
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
