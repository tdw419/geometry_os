; DESCRIPTION: Places a purple line segment connecting (138, 1) to (11, 185).
; PLAN: r0=138(x1), r1=1(y1), r2=11(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 1
LDI r2, 11
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
