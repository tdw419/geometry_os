; DESCRIPTION: Renders a yellow line between points (15, 15) and (116, 41).
; PLAN: r0=15(x1), r1=15(y1), r2=116(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 15
LDI r2, 116
LDI r3, 41
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
