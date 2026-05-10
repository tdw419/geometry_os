; DESCRIPTION: Places a purple line segment connecting (347, 224) to (172, 191).
; PLAN: r0=347(x1), r1=224(y1), r2=172(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 224
LDI r2, 172
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
