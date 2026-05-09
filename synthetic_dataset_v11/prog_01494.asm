; DESCRIPTION: Draws a white line from (94, 61) to (252, 52).
; PLAN: r0=94(x1), r1=61(y1), r2=252(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 61
LDI r2, 252
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
