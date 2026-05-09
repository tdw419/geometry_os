; DESCRIPTION: Places a purple line segment connecting (232, 0) to (108, 5).
; PLAN: r0=232(x1), r1=0(y1), r2=108(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 0
LDI r2, 108
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
