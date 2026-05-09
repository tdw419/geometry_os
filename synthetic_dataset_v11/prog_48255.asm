; DESCRIPTION: Places a purple line segment connecting (239, 105) to (251, 155).
; PLAN: r0=239(x1), r1=105(y1), r2=251(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 105
LDI r2, 251
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
