; DESCRIPTION: Places a black line segment connecting (2, 29) to (195, 234).
; PLAN: r0=2(x1), r1=29(y1), r2=195(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 29
LDI r2, 195
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
