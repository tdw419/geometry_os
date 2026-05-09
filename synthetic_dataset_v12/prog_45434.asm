; DESCRIPTION: Places a purple line segment connecting (19, 185) to (219, 153).
; PLAN: r0=19(x1), r1=185(y1), r2=219(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 185
LDI r2, 219
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
