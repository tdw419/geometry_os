; DESCRIPTION: Places a purple line segment connecting (419, 53) to (506, 219).
; PLAN: r0=419(x1), r1=53(y1), r2=506(x2), r3=219(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 53
LDI r2, 506
LDI r3, 219
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
