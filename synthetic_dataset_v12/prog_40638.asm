; DESCRIPTION: Places a black line segment connecting (15, 234) to (486, 158).
; PLAN: r0=15(x1), r1=234(y1), r2=486(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 234
LDI r2, 486
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
