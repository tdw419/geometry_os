; DESCRIPTION: Places a black line segment connecting (181, 20) to (192, 183).
; PLAN: r0=181(x1), r1=20(y1), r2=192(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 20
LDI r2, 192
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
