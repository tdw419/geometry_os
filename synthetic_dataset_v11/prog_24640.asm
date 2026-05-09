; DESCRIPTION: Places a black line segment connecting (246, 158) to (76, 109).
; PLAN: r0=246(x1), r1=158(y1), r2=76(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 158
LDI r2, 76
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
