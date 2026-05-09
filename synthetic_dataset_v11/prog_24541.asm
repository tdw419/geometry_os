; DESCRIPTION: Places a purple line segment connecting (70, 217) to (29, 69).
; PLAN: r0=70(x1), r1=217(y1), r2=29(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 217
LDI r2, 29
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
