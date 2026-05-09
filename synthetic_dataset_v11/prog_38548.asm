; DESCRIPTION: Places a purple line segment connecting (232, 83) to (155, 35).
; PLAN: r0=232(x1), r1=83(y1), r2=155(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 83
LDI r2, 155
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
