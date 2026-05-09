; DESCRIPTION: Places a purple line segment connecting (112, 24) to (28, 217).
; PLAN: r0=112(x1), r1=24(y1), r2=28(x2), r3=217(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 24
LDI r2, 28
LDI r3, 217
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
