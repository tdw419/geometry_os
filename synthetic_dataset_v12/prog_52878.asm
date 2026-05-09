; DESCRIPTION: Places a black line segment connecting (266, 246) to (129, 0).
; PLAN: r0=266(x1), r1=246(y1), r2=129(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 246
LDI r2, 129
LDI r3, 0
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
