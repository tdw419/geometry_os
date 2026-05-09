; DESCRIPTION: Renders a white line between points (232, 39) and (41, 214).
; PLAN: r0=232(x1), r1=39(y1), r2=41(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 39
LDI r2, 41
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
