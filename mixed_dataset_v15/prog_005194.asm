; DESCRIPTION: Renders a orange line between points (140, 195) and (296, 124).
; PLAN: r0=140(x1), r1=195(y1), r2=296(x2), r3=124(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 195
LDI r2, 296
LDI r3, 124
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
