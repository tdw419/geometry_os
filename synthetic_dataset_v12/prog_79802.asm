; DESCRIPTION: Places a purple line segment connecting (382, 158) to (84, 30).
; PLAN: r0=382(x1), r1=158(y1), r2=84(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 158
LDI r2, 84
LDI r3, 30
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
