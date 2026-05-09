; DESCRIPTION: Renders a black line between points (145, 2) and (137, 41).
; PLAN: r0=145(x1), r1=2(y1), r2=137(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 2
LDI r2, 137
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
