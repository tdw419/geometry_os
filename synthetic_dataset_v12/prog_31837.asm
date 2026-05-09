; DESCRIPTION: Places a purple line segment connecting (207, 50) to (451, 24).
; PLAN: r0=207(x1), r1=50(y1), r2=451(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 50
LDI r2, 451
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
