; DESCRIPTION: Places a purple line segment connecting (144, 251) to (231, 8).
; PLAN: r0=144(x1), r1=251(y1), r2=231(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 251
LDI r2, 231
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
