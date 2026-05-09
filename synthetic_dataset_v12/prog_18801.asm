; DESCRIPTION: Renders a black line between points (455, 41) and (73, 118).
; PLAN: r0=455(x1), r1=41(y1), r2=73(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 41
LDI r2, 73
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
