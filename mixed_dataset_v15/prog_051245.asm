; DESCRIPTION: Places a blue line segment connecting (325, 78) to (496, 217).
; PLAN: r0=325(x1), r1=78(y1), r2=496(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 78
LDI r2, 496
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
