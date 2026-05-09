; DESCRIPTION: Places a blue line segment connecting (492, 41) to (53, 96).
; PLAN: r0=492(x1), r1=41(y1), r2=53(x2), r3=96(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 41
LDI r2, 53
LDI r3, 96
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
