; DESCRIPTION: Places a purple line segment connecting (155, 64) to (331, 239).
; PLAN: r0=155(x1), r1=64(y1), r2=331(x2), r3=239(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 64
LDI r2, 331
LDI r3, 239
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
