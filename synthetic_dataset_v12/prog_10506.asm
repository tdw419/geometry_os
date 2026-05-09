; DESCRIPTION: Places a purple line segment connecting (122, 92) to (100, 254).
; PLAN: r0=122(x1), r1=92(y1), r2=100(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 92
LDI r2, 100
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
