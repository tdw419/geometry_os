; DESCRIPTION: Places a purple line segment connecting (485, 57) to (3, 35).
; PLAN: r0=485(x1), r1=57(y1), r2=3(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 57
LDI r2, 3
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
