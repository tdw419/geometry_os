; DESCRIPTION: Places a purple line segment connecting (351, 96) to (203, 8).
; PLAN: r0=351(x1), r1=96(y1), r2=203(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 96
LDI r2, 203
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
