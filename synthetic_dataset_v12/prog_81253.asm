; DESCRIPTION: Places a purple line segment connecting (324, 121) to (388, 58).
; PLAN: r0=324(x1), r1=121(y1), r2=388(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 121
LDI r2, 388
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
