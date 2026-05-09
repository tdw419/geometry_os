; DESCRIPTION: Places a purple line segment connecting (83, 97) to (271, 105).
; PLAN: r0=83(x1), r1=97(y1), r2=271(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 97
LDI r2, 271
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
