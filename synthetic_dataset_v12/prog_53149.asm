; DESCRIPTION: Places a black line segment connecting (483, 138) to (498, 181).
; PLAN: r0=483(x1), r1=138(y1), r2=498(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 138
LDI r2, 498
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
