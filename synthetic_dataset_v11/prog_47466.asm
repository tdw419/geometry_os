; DESCRIPTION: Places a purple line segment connecting (254, 14) to (17, 216).
; PLAN: r0=254(x1), r1=14(y1), r2=17(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 14
LDI r2, 17
LDI r3, 216
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
