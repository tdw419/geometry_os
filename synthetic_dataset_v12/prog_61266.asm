; DESCRIPTION: Renders a green line between points (331, 4) and (41, 130).
; PLAN: r0=331(x1), r1=4(y1), r2=41(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 4
LDI r2, 41
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
