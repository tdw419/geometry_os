; DESCRIPTION: Renders a black line between points (41, 60) and (65, 10).
; PLAN: r0=41(x1), r1=60(y1), r2=65(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 60
LDI r2, 65
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
