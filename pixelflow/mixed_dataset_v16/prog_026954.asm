; DESCRIPTION: Places a black line segment connecting (232, 143) to (15, 123).
; PLAN: r0=232(x1), r1=143(y1), r2=15(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 143
LDI r2, 15
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
