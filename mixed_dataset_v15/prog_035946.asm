; DESCRIPTION: Places a black line segment connecting (244, 160) to (318, 139).
; PLAN: r0=244(x1), r1=160(y1), r2=318(x2), r3=139(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 160
LDI r2, 318
LDI r3, 139
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
