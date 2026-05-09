; DESCRIPTION: Places a purple line segment connecting (499, 217) to (14, 2).
; PLAN: r0=499(x1), r1=217(y1), r2=14(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 217
LDI r2, 14
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
