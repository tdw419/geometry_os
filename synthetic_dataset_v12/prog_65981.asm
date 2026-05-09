; DESCRIPTION: Places a purple line segment connecting (299, 222) to (216, 217).
; PLAN: r0=299(x1), r1=222(y1), r2=216(x2), r3=217(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 222
LDI r2, 216
LDI r3, 217
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
