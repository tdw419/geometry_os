; DESCRIPTION: Places a purple line segment connecting (211, 144) to (170, 128).
; PLAN: r0=211(x1), r1=144(y1), r2=170(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 144
LDI r2, 170
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
