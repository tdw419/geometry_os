; DESCRIPTION: Renders a black line between points (41, 14) and (207, 183).
; PLAN: r0=41(x1), r1=14(y1), r2=207(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 14
LDI r2, 207
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
