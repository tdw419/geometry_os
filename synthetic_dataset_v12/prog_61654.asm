; DESCRIPTION: Places a black line segment connecting (214, 78) to (192, 133).
; PLAN: r0=214(x1), r1=78(y1), r2=192(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 78
LDI r2, 192
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
