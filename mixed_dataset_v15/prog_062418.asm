; DESCRIPTION: Places a purple line segment connecting (302, 140) to (312, 102).
; PLAN: r0=302(x1), r1=140(y1), r2=312(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 140
LDI r2, 312
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
