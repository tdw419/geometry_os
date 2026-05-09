; DESCRIPTION: Places a blue line segment connecting (390, 139) to (234, 121).
; PLAN: r0=390(x1), r1=139(y1), r2=234(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 139
LDI r2, 234
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
