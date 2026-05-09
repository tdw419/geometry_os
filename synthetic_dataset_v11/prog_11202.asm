; DESCRIPTION: Places a purple line segment connecting (64, 76) to (137, 56).
; PLAN: r0=64(x1), r1=76(y1), r2=137(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 76
LDI r2, 137
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
