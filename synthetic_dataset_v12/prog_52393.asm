; DESCRIPTION: Places a blue line segment connecting (11, 56) to (418, 88).
; PLAN: r0=11(x1), r1=56(y1), r2=418(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 56
LDI r2, 418
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
