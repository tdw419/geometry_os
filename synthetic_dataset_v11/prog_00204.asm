; DESCRIPTION: Places a purple line segment connecting (78, 177) to (111, 36).
; PLAN: r0=78(x1), r1=177(y1), r2=111(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 177
LDI r2, 111
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
