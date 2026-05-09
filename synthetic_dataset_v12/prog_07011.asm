; DESCRIPTION: Places a purple line segment connecting (22, 216) to (19, 57).
; PLAN: r0=22(x1), r1=216(y1), r2=19(x2), r3=57(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 216
LDI r2, 19
LDI r3, 57
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
