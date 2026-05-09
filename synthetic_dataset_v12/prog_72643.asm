; DESCRIPTION: Places a black line segment connecting (85, 234) to (163, 72).
; PLAN: r0=85(x1), r1=234(y1), r2=163(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 234
LDI r2, 163
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
