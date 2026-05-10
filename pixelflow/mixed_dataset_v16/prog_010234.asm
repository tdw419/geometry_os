; DESCRIPTION: Places a purple line segment connecting (58, 50) to (357, 17).
; PLAN: r0=58(x1), r1=50(y1), r2=357(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 50
LDI r2, 357
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
