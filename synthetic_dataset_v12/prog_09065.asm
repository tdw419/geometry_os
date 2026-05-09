; DESCRIPTION: Renders a purple line between points (39, 87) and (282, 41).
; PLAN: r0=39(x1), r1=87(y1), r2=282(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 87
LDI r2, 282
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
