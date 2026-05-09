; DESCRIPTION: Places a black line segment connecting (88, 189) to (459, 70).
; PLAN: r0=88(x1), r1=189(y1), r2=459(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 189
LDI r2, 459
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
