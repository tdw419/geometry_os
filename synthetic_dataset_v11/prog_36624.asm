; DESCRIPTION: Places a purple line segment connecting (166, 232) to (192, 224).
; PLAN: r0=166(x1), r1=232(y1), r2=192(x2), r3=224(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 232
LDI r2, 192
LDI r3, 224
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
