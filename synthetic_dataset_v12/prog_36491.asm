; DESCRIPTION: Places a black line segment connecting (492, 217) to (151, 105).
; PLAN: r0=492(x1), r1=217(y1), r2=151(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 217
LDI r2, 151
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
