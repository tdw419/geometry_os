; DESCRIPTION: Draws a black line from (175, 150) to (41, 241).
; PLAN: r0=175(x1), r1=150(y1), r2=41(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 150
LDI r2, 41
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
