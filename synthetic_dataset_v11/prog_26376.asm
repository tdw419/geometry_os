; DESCRIPTION: Places a black line segment connecting (34, 5) to (192, 157).
; PLAN: r0=34(x1), r1=5(y1), r2=192(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 5
LDI r2, 192
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
