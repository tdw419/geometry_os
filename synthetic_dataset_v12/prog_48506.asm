; DESCRIPTION: Places a purple line segment connecting (268, 251) to (364, 90).
; PLAN: r0=268(x1), r1=251(y1), r2=364(x2), r3=90(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 251
LDI r2, 364
LDI r3, 90
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
