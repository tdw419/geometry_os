; DESCRIPTION: Places a black line segment connecting (129, 246) to (454, 72).
; PLAN: r0=129(x1), r1=246(y1), r2=454(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 246
LDI r2, 454
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
