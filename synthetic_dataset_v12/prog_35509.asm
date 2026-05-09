; DESCRIPTION: Places a black line segment connecting (378, 167) to (334, 194).
; PLAN: r0=378(x1), r1=167(y1), r2=334(x2), r3=194(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 167
LDI r2, 334
LDI r3, 194
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
