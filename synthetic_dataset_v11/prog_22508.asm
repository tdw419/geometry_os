; DESCRIPTION: Places a black line segment connecting (13, 92) to (250, 248).
; PLAN: r0=13(x1), r1=92(y1), r2=250(x2), r3=248(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 92
LDI r2, 250
LDI r3, 248
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
