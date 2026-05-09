; DESCRIPTION: Places a purple line segment connecting (266, 118) to (357, 145).
; PLAN: r0=266(x1), r1=118(y1), r2=357(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 118
LDI r2, 357
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
