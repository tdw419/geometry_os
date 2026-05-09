; DESCRIPTION: Places a purple line segment connecting (224, 126) to (227, 78).
; PLAN: r0=224(x1), r1=126(y1), r2=227(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 126
LDI r2, 227
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
