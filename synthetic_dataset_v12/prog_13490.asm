; DESCRIPTION: Places a black line segment connecting (115, 35) to (468, 105).
; PLAN: r0=115(x1), r1=35(y1), r2=468(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 35
LDI r2, 468
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
