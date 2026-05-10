; DESCRIPTION: Places a yellow line segment connecting (53, 30) to (102, 155).
; PLAN: r0=53(x1), r1=30(y1), r2=102(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 30
LDI r2, 102
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
