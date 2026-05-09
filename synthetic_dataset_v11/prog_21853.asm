; DESCRIPTION: Places a yellow line segment connecting (47, 49) to (192, 18).
; PLAN: r0=47(x1), r1=49(y1), r2=192(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 49
LDI r2, 192
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
