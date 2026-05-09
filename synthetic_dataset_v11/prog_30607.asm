; DESCRIPTION: Places a purple line segment connecting (194, 217) to (165, 110).
; PLAN: r0=194(x1), r1=217(y1), r2=165(x2), r3=110(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 217
LDI r2, 165
LDI r3, 110
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
