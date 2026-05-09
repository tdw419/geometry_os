; DESCRIPTION: Places a purple line segment connecting (474, 143) to (323, 224).
; PLAN: r0=474(x1), r1=143(y1), r2=323(x2), r3=224(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 143
LDI r2, 323
LDI r3, 224
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
