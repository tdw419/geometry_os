; DESCRIPTION: Places a purple line segment connecting (302, 78) to (378, 158).
; PLAN: r0=302(x1), r1=78(y1), r2=378(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 78
LDI r2, 378
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
