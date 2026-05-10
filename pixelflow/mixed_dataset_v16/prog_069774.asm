; DESCRIPTION: Places a purple line segment connecting (97, 192) to (371, 85).
; PLAN: r0=97(x1), r1=192(y1), r2=371(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 192
LDI r2, 371
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
