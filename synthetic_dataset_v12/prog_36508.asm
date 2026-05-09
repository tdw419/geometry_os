; DESCRIPTION: Places a blue line segment connecting (478, 41) to (20, 165).
; PLAN: r0=478(x1), r1=41(y1), r2=20(x2), r3=165(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 41
LDI r2, 20
LDI r3, 165
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
