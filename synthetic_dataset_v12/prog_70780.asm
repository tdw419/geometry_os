; DESCRIPTION: Places a purple line segment connecting (397, 136) to (39, 232).
; PLAN: r0=397(x1), r1=136(y1), r2=39(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 136
LDI r2, 39
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
