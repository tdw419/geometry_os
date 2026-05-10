; DESCRIPTION: Renders a black line between points (66, 41) and (258, 187).
; PLAN: r0=66(x1), r1=41(y1), r2=258(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 41
LDI r2, 258
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
