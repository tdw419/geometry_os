; DESCRIPTION: Places a purple line segment connecting (170, 87) to (291, 205).
; PLAN: r0=170(x1), r1=87(y1), r2=291(x2), r3=205(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 87
LDI r2, 291
LDI r3, 205
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
