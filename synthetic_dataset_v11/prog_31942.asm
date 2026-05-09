; DESCRIPTION: Places a black line segment connecting (112, 86) to (64, 245).
; PLAN: r0=112(x1), r1=86(y1), r2=64(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 86
LDI r2, 64
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
