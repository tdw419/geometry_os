; DESCRIPTION: Places a purple line segment connecting (200, 13) to (136, 247).
; PLAN: r0=200(x1), r1=13(y1), r2=136(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 13
LDI r2, 136
LDI r3, 247
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
