; DESCRIPTION: Places a white line segment connecting (387, 41) to (324, 49).
; PLAN: r0=387(x1), r1=41(y1), r2=324(x2), r3=49(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 41
LDI r2, 324
LDI r3, 49
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
