; DESCRIPTION: Places a purple line segment connecting (378, 181) to (27, 88).
; PLAN: r0=378(x1), r1=181(y1), r2=27(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 181
LDI r2, 27
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
