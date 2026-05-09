; DESCRIPTION: Places a yellow line segment connecting (280, 19) to (325, 147).
; PLAN: r0=280(x1), r1=19(y1), r2=325(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 19
LDI r2, 325
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
