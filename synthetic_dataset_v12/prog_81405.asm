; DESCRIPTION: Places a purple line segment connecting (135, 87) to (227, 74).
; PLAN: r0=135(x1), r1=87(y1), r2=227(x2), r3=74(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 87
LDI r2, 227
LDI r3, 74
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
