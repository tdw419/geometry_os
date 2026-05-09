; DESCRIPTION: Places a white line segment connecting (451, 248) to (477, 61).
; PLAN: r0=451(x1), r1=248(y1), r2=477(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 248
LDI r2, 477
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
