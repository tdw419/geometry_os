; DESCRIPTION: Places a purple line segment connecting (171, 101) to (379, 218).
; PLAN: r0=171(x1), r1=101(y1), r2=379(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 101
LDI r2, 379
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
