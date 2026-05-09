; DESCRIPTION: Places a black line segment connecting (342, 88) to (232, 241).
; PLAN: r0=342(x1), r1=88(y1), r2=232(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 88
LDI r2, 232
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
