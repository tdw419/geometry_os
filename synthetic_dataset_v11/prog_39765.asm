; DESCRIPTION: Places a black line segment connecting (200, 92) to (49, 184).
; PLAN: r0=200(x1), r1=92(y1), r2=49(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 92
LDI r2, 49
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
