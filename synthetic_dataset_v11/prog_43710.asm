; DESCRIPTION: Places a purple line segment connecting (233, 204) to (1, 230).
; PLAN: r0=233(x1), r1=204(y1), r2=1(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 204
LDI r2, 1
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
