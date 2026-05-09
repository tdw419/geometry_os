; DESCRIPTION: Places a green line segment connecting (478, 142) to (496, 72).
; PLAN: r0=478(x1), r1=142(y1), r2=496(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 142
LDI r2, 496
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
