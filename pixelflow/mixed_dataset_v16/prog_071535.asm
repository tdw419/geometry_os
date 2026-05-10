; DESCRIPTION: Places a purple line segment connecting (256, 37) to (478, 96).
; PLAN: r0=256(x1), r1=37(y1), r2=478(x2), r3=96(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 37
LDI r2, 478
LDI r3, 96
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
