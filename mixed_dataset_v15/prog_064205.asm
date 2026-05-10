; DESCRIPTION: Places a purple line segment connecting (12, 233) to (56, 232).
; PLAN: r0=12(x1), r1=233(y1), r2=56(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 233
LDI r2, 56
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
