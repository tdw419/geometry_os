; DESCRIPTION: Places a white line segment connecting (389, 62) to (14, 41).
; PLAN: r0=389(x1), r1=62(y1), r2=14(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 62
LDI r2, 14
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
