; DESCRIPTION: Places a purple line segment connecting (85, 88) to (359, 80).
; PLAN: r0=85(x1), r1=88(y1), r2=359(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 88
LDI r2, 359
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
