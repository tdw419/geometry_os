; DESCRIPTION: Places a black line segment connecting (507, 45) to (139, 245).
; PLAN: r0=507(x1), r1=45(y1), r2=139(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 45
LDI r2, 139
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
