; DESCRIPTION: Places a black line segment connecting (271, 67) to (484, 185).
; PLAN: r0=271(x1), r1=67(y1), r2=484(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 67
LDI r2, 484
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
