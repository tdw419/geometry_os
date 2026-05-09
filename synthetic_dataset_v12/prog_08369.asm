; DESCRIPTION: Places a black line segment connecting (181, 11) to (4, 133).
; PLAN: r0=181(x1), r1=11(y1), r2=4(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 11
LDI r2, 4
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
