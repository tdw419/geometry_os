; DESCRIPTION: Places a yellow line segment connecting (53, 88) to (133, 137).
; PLAN: r0=53(x1), r1=88(y1), r2=133(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 88
LDI r2, 133
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
