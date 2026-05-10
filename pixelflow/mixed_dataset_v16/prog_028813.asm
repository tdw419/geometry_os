; DESCRIPTION: Places a yellow line segment connecting (478, 92) to (8, 73).
; PLAN: r0=478(x1), r1=92(y1), r2=8(x2), r3=73(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 92
LDI r2, 8
LDI r3, 73
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
