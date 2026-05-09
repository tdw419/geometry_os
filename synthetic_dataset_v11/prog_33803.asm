; DESCRIPTION: Places a blue line segment connecting (121, 155) to (254, 23).
; PLAN: r0=121(x1), r1=155(y1), r2=254(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 155
LDI r2, 254
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
