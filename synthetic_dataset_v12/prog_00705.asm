; DESCRIPTION: Places a red line segment connecting (314, 28) to (332, 211).
; PLAN: r0=314(x1), r1=28(y1), r2=332(x2), r3=211(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 28
LDI r2, 332
LDI r3, 211
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
