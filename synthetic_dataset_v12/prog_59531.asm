; DESCRIPTION: Places a purple line segment connecting (155, 52) to (354, 35).
; PLAN: r0=155(x1), r1=52(y1), r2=354(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 52
LDI r2, 354
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
