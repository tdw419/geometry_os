; DESCRIPTION: Places a purple line segment connecting (395, 220) to (473, 227).
; PLAN: r0=395(x1), r1=220(y1), r2=473(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 220
LDI r2, 473
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
