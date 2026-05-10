; DESCRIPTION: Places a black line segment connecting (194, 100) to (391, 158).
; PLAN: r0=194(x1), r1=100(y1), r2=391(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 100
LDI r2, 391
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
