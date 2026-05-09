; DESCRIPTION: Places a purple line segment connecting (200, 238) to (176, 237).
; PLAN: r0=200(x1), r1=238(y1), r2=176(x2), r3=237(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 238
LDI r2, 176
LDI r3, 237
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
