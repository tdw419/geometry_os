; DESCRIPTION: Places a purple line segment connecting (76, 22) to (73, 191).
; PLAN: r0=76(x1), r1=22(y1), r2=73(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 22
LDI r2, 73
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
