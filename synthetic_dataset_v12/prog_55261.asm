; DESCRIPTION: Draws a white line from (151, 94) to (252, 34).
; PLAN: r0=151(x1), r1=94(y1), r2=252(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 94
LDI r2, 252
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
