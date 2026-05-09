; DESCRIPTION: Places a black line segment connecting (15, 216) to (192, 2).
; PLAN: r0=15(x1), r1=216(y1), r2=192(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 216
LDI r2, 192
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
