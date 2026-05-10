; DESCRIPTION: Places a black line segment connecting (341, 9) to (142, 194).
; PLAN: r0=341(x1), r1=9(y1), r2=142(x2), r3=194(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 9
LDI r2, 142
LDI r3, 194
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
