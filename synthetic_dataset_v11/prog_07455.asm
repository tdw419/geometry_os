; DESCRIPTION: Places a purple line segment connecting (144, 251) to (15, 81).
; PLAN: r0=144(x1), r1=251(y1), r2=15(x2), r3=81(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 251
LDI r2, 15
LDI r3, 81
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
