; DESCRIPTION: Renders a black line between points (150, 41) and (201, 66).
; PLAN: r0=150(x1), r1=41(y1), r2=201(x2), r3=66(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 41
LDI r2, 201
LDI r3, 66
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
