; DESCRIPTION: Places a black line segment connecting (359, 174) to (76, 53).
; PLAN: r0=359(x1), r1=174(y1), r2=76(x2), r3=53(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 174
LDI r2, 76
LDI r3, 53
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
