; DESCRIPTION: Places a purple line segment connecting (476, 98) to (204, 193).
; PLAN: r0=476(x1), r1=98(y1), r2=204(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 98
LDI r2, 204
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
