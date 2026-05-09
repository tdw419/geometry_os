; DESCRIPTION: Places a purple line segment connecting (125, 219) to (435, 100).
; PLAN: r0=125(x1), r1=219(y1), r2=435(x2), r3=100(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 219
LDI r2, 435
LDI r3, 100
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
