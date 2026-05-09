; DESCRIPTION: Places a purple line segment connecting (203, 147) to (28, 122).
; PLAN: r0=203(x1), r1=147(y1), r2=28(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 147
LDI r2, 28
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
