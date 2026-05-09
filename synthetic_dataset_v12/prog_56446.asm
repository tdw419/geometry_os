; DESCRIPTION: Places a blue line segment connecting (101, 104) to (141, 10).
; PLAN: r0=101(x1), r1=104(y1), r2=141(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 104
LDI r2, 141
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
