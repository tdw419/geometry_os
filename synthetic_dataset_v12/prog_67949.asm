; DESCRIPTION: Places a black line segment connecting (78, 17) to (358, 166).
; PLAN: r0=78(x1), r1=17(y1), r2=358(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 17
LDI r2, 358
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
