; DESCRIPTION: Places a white line segment connecting (314, 89) to (268, 64).
; PLAN: r0=314(x1), r1=89(y1), r2=268(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 89
LDI r2, 268
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
