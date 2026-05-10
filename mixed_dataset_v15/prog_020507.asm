; DESCRIPTION: Places a purple line segment connecting (122, 108) to (420, 201).
; PLAN: r0=122(x1), r1=108(y1), r2=420(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 108
LDI r2, 420
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
