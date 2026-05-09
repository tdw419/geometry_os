; DESCRIPTION: Places a purple line segment connecting (506, 51) to (490, 145).
; PLAN: r0=506(x1), r1=51(y1), r2=490(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 51
LDI r2, 490
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
