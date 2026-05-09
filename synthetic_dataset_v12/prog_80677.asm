; DESCRIPTION: Places a purple line segment connecting (108, 62) to (102, 147).
; PLAN: r0=108(x1), r1=62(y1), r2=102(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 62
LDI r2, 102
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
