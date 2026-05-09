; DESCRIPTION: Renders a orange line between points (296, 238) and (251, 130).
; PLAN: r0=296(x1), r1=238(y1), r2=251(x2), r3=130(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 238
LDI r2, 251
LDI r3, 130
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
