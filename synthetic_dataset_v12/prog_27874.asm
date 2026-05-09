; DESCRIPTION: Places a yellow line segment connecting (484, 53) to (469, 1).
; PLAN: r0=484(x1), r1=53(y1), r2=469(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 53
LDI r2, 469
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
