; DESCRIPTION: Places a blue line segment connecting (419, 26) to (22, 217).
; PLAN: r0=419(x1), r1=26(y1), r2=22(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 26
LDI r2, 22
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
