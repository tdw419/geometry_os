; DESCRIPTION: Places a black line segment connecting (76, 86) to (358, 181).
; PLAN: r0=76(x1), r1=86(y1), r2=358(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 86
LDI r2, 358
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
