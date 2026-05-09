; DESCRIPTION: Places a black line segment connecting (164, 17) to (171, 245).
; PLAN: r0=164(x1), r1=17(y1), r2=171(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 17
LDI r2, 171
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
