; DESCRIPTION: Places a blue line segment connecting (160, 17) to (477, 41).
; PLAN: r0=160(x1), r1=17(y1), r2=477(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 17
LDI r2, 477
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
