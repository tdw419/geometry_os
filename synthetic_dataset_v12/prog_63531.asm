; DESCRIPTION: Places a purple line segment connecting (451, 48) to (81, 49).
; PLAN: r0=451(x1), r1=48(y1), r2=81(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 48
LDI r2, 81
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
