; DESCRIPTION: Places a purple line segment connecting (219, 55) to (159, 216).
; PLAN: r0=219(x1), r1=55(y1), r2=159(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 55
LDI r2, 159
LDI r3, 216
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
