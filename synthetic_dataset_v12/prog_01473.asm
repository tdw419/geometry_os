; DESCRIPTION: Places a purple line segment connecting (27, 225) to (451, 90).
; PLAN: r0=27(x1), r1=225(y1), r2=451(x2), r3=90(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 225
LDI r2, 451
LDI r3, 90
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
