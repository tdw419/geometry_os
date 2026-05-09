; DESCRIPTION: Places a purple line segment connecting (29, 232) to (1, 52).
; PLAN: r0=29(x1), r1=232(y1), r2=1(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 232
LDI r2, 1
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
