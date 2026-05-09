; DESCRIPTION: Places a blue line segment connecting (496, 88) to (1, 181).
; PLAN: r0=496(x1), r1=88(y1), r2=1(x2), r3=181(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 88
LDI r2, 1
LDI r3, 181
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
