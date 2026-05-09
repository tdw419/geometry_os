; DESCRIPTION: Renders a purple line between points (234, 41) and (150, 115).
; PLAN: r0=234(x1), r1=41(y1), r2=150(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 41
LDI r2, 150
LDI r3, 115
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
