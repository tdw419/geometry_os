; DESCRIPTION: Draws a black line from (20, 57) to (41, 122).
; PLAN: r0=20(x1), r1=57(y1), r2=41(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 57
LDI r2, 41
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
