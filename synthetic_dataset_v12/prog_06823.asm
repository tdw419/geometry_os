; DESCRIPTION: Places a purple line segment connecting (219, 172) to (14, 105).
; PLAN: r0=219(x1), r1=172(y1), r2=14(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 172
LDI r2, 14
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
