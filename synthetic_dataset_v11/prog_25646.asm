; DESCRIPTION: Places a purple line segment connecting (15, 249) to (6, 39).
; PLAN: r0=15(x1), r1=249(y1), r2=6(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 249
LDI r2, 6
LDI r3, 39
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
