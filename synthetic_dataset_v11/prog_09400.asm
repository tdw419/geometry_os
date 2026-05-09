; DESCRIPTION: Places a purple line segment connecting (226, 75) to (219, 218).
; PLAN: r0=226(x1), r1=75(y1), r2=219(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 75
LDI r2, 219
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
