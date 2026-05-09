; DESCRIPTION: Renders a yellow line between points (47, 248) and (125, 41).
; PLAN: r0=47(x1), r1=248(y1), r2=125(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 248
LDI r2, 125
LDI r3, 41
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
