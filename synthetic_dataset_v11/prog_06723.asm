; DESCRIPTION: Places a blue line segment connecting (8, 163) to (102, 41).
; PLAN: r0=8(x1), r1=163(y1), r2=102(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 163
LDI r2, 102
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
