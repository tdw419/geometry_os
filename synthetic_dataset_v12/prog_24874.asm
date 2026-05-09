; DESCRIPTION: Draws a white line from (339, 83) to (491, 89).
; PLAN: r0=339(x1), r1=83(y1), r2=491(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 83
LDI r2, 491
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
