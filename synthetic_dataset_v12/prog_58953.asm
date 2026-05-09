; DESCRIPTION: Places a purple line segment connecting (325, 20) to (418, 102).
; PLAN: r0=325(x1), r1=20(y1), r2=418(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 20
LDI r2, 418
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
