; DESCRIPTION: Places a purple line segment connecting (92, 123) to (90, 39).
; PLAN: r0=92(x1), r1=123(y1), r2=90(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 123
LDI r2, 90
LDI r3, 39
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
