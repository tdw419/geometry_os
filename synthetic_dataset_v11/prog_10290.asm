; DESCRIPTION: Renders a cyan line between points (41, 203) and (105, 147).
; PLAN: r0=41(x1), r1=203(y1), r2=105(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 203
LDI r2, 105
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
