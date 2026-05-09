; DESCRIPTION: Places a purple line segment connecting (473, 145) to (297, 90).
; PLAN: r0=473(x1), r1=145(y1), r2=297(x2), r3=90(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 145
LDI r2, 297
LDI r3, 90
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
