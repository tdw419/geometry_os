; DESCRIPTION: Renders a black line between points (246, 41) and (176, 201).
; PLAN: r0=246(x1), r1=41(y1), r2=176(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 41
LDI r2, 176
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
