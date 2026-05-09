; DESCRIPTION: Places a black line segment connecting (309, 14) to (459, 11).
; PLAN: r0=309(x1), r1=14(y1), r2=459(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 14
LDI r2, 459
LDI r3, 11
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
