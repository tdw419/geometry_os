; DESCRIPTION: Places a black line segment connecting (34, 49) to (129, 22).
; PLAN: r0=34(x1), r1=49(y1), r2=129(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 49
LDI r2, 129
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
