; DESCRIPTION: Draws a white line from (129, 95) to (220, 41).
; PLAN: r0=129(x1), r1=95(y1), r2=220(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 95
LDI r2, 220
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
