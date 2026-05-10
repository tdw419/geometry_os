; DESCRIPTION: Draws a black line from (351, 183) to (41, 214).
; PLAN: r0=351(x1), r1=183(y1), r2=41(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 183
LDI r2, 41
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
