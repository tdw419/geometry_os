; DESCRIPTION: Places a black line segment connecting (316, 49) to (131, 58).
; PLAN: r0=316(x1), r1=49(y1), r2=131(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 49
LDI r2, 131
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
