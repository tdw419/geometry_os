; DESCRIPTION: Places a purple line segment connecting (451, 142) to (450, 145).
; PLAN: r0=451(x1), r1=142(y1), r2=450(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 142
LDI r2, 450
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
