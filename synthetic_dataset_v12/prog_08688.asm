; DESCRIPTION: Places a blue line segment connecting (496, 179) to (490, 46).
; PLAN: r0=496(x1), r1=179(y1), r2=490(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 179
LDI r2, 490
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
