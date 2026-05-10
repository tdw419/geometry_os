; DESCRIPTION: Places a purple line segment connecting (388, 225) to (476, 199).
; PLAN: r0=388(x1), r1=225(y1), r2=476(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 225
LDI r2, 476
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
