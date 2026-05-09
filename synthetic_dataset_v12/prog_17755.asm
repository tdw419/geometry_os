; DESCRIPTION: Places a purple line segment connecting (368, 19) to (379, 101).
; PLAN: r0=368(x1), r1=19(y1), r2=379(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 19
LDI r2, 379
LDI r3, 101
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
