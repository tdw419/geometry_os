; DESCRIPTION: Places a purple line segment connecting (85, 219) to (135, 49).
; PLAN: r0=85(x1), r1=219(y1), r2=135(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 219
LDI r2, 135
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
