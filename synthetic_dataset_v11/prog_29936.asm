; DESCRIPTION: Places a black line segment connecting (147, 15) to (93, 234).
; PLAN: r0=147(x1), r1=15(y1), r2=93(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 15
LDI r2, 93
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
