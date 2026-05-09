; DESCRIPTION: Places a purple line segment connecting (33, 135) to (132, 19).
; PLAN: r0=33(x1), r1=135(y1), r2=132(x2), r3=19(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 135
LDI r2, 132
LDI r3, 19
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
