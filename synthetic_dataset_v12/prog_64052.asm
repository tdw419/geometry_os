; DESCRIPTION: Renders a black line between points (130, 176) and (89, 159).
; PLAN: r0=130(x1), r1=176(y1), r2=89(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 176
LDI r2, 89
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
