; DESCRIPTION: Places a blue line segment connecting (88, 100) to (496, 46).
; PLAN: r0=88(x1), r1=100(y1), r2=496(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 100
LDI r2, 496
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
