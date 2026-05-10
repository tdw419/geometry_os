; DESCRIPTION: Places a purple line segment connecting (238, 132) to (447, 43).
; PLAN: r0=238(x1), r1=132(y1), r2=447(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 132
LDI r2, 447
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
