; DESCRIPTION: Places a blue line segment connecting (461, 101) to (469, 109).
; PLAN: r0=461(x1), r1=101(y1), r2=469(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 101
LDI r2, 469
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
