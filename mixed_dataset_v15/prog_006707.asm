; DESCRIPTION: Renders a black line between points (30, 136) and (126, 41).
; PLAN: r0=30(x1), r1=136(y1), r2=126(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 136
LDI r2, 126
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
