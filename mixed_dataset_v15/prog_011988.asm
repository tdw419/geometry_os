; DESCRIPTION: Renders a black line between points (72, 41) and (427, 115).
; PLAN: r0=72(x1), r1=41(y1), r2=427(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 41
LDI r2, 427
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
