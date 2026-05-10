; DESCRIPTION: Renders a black line between points (76, 146) and (220, 41).
; PLAN: r0=76(x1), r1=146(y1), r2=220(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 146
LDI r2, 220
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
