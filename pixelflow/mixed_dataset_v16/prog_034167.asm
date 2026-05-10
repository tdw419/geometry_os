; DESCRIPTION: Places a black line segment connecting (282, 79) to (468, 18).
; PLAN: r0=282(x1), r1=79(y1), r2=468(x2), r3=18(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 79
LDI r2, 468
LDI r3, 18
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
