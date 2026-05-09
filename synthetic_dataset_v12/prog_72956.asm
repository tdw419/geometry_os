; DESCRIPTION: Places a purple line segment connecting (291, 78) to (441, 70).
; PLAN: r0=291(x1), r1=78(y1), r2=441(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 78
LDI r2, 441
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
