; DESCRIPTION: Places a black line segment connecting (484, 53) to (492, 106).
; PLAN: r0=484(x1), r1=53(y1), r2=492(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 53
LDI r2, 492
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
