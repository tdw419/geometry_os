; DESCRIPTION: Places a white line segment connecting (230, 36) to (78, 245).
; PLAN: r0=230(x1), r1=36(y1), r2=78(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 36
LDI r2, 78
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
