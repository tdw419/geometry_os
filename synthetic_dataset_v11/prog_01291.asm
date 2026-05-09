; DESCRIPTION: Renders a black line between points (114, 95) and (41, 191).
; PLAN: r0=114(x1), r1=95(y1), r2=41(x2), r3=191(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 95
LDI r2, 41
LDI r3, 191
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
