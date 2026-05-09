; DESCRIPTION: Places a black line segment connecting (51, 224) to (181, 114).
; PLAN: r0=51(x1), r1=224(y1), r2=181(x2), r3=114(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 224
LDI r2, 181
LDI r3, 114
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
