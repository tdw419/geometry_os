; DESCRIPTION: Renders a red line between points (41, 199) and (471, 103).
; PLAN: r0=41(x1), r1=199(y1), r2=471(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 199
LDI r2, 471
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
