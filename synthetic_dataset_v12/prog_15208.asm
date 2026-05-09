; DESCRIPTION: Places a white line segment connecting (229, 94) to (315, 41).
; PLAN: r0=229(x1), r1=94(y1), r2=315(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 94
LDI r2, 315
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
