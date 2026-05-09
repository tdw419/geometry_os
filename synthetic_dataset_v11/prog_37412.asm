; DESCRIPTION: Places a purple line segment connecting (8, 238) to (254, 147).
; PLAN: r0=8(x1), r1=238(y1), r2=254(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 238
LDI r2, 254
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
