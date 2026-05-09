; DESCRIPTION: Places a purple line segment connecting (134, 219) to (107, 157).
; PLAN: r0=134(x1), r1=219(y1), r2=107(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 219
LDI r2, 107
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
