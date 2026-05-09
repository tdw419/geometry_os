; DESCRIPTION: Draws a white line from (477, 41) to (332, 214).
; PLAN: r0=477(x1), r1=41(y1), r2=332(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 41
LDI r2, 332
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
