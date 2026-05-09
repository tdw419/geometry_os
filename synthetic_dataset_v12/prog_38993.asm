; DESCRIPTION: Places a white line segment connecting (477, 49) to (20, 74).
; PLAN: r0=477(x1), r1=49(y1), r2=20(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 49
LDI r2, 20
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
