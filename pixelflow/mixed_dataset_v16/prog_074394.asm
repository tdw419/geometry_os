; DESCRIPTION: Places a black line segment connecting (55, 88) to (468, 86).
; PLAN: r0=55(x1), r1=88(y1), r2=468(x2), r3=86(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 88
LDI r2, 468
LDI r3, 86
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
