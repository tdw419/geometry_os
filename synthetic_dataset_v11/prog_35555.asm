; DESCRIPTION: Places a purple line segment connecting (104, 17) to (0, 147).
; PLAN: r0=104(x1), r1=17(y1), r2=0(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 17
LDI r2, 0
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
