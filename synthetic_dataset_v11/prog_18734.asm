; DESCRIPTION: Places a black line segment connecting (157, 44) to (62, 181).
; PLAN: r0=157(x1), r1=44(y1), r2=62(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 44
LDI r2, 62
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
