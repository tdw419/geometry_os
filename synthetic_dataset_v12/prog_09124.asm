; DESCRIPTION: Places a black line segment connecting (78, 65) to (257, 130).
; PLAN: r0=78(x1), r1=65(y1), r2=257(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 65
LDI r2, 257
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
