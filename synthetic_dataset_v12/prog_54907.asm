; DESCRIPTION: Places a purple line segment connecting (351, 101) to (108, 51).
; PLAN: r0=351(x1), r1=101(y1), r2=108(x2), r3=51(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 101
LDI r2, 108
LDI r3, 51
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
