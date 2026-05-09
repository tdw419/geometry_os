; DESCRIPTION: Places a purple line segment connecting (461, 248) to (84, 102).
; PLAN: r0=461(x1), r1=248(y1), r2=84(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 248
LDI r2, 84
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
