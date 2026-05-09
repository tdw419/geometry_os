; DESCRIPTION: Renders a orange line between points (209, 123) and (478, 74).
; PLAN: r0=209(x1), r1=123(y1), r2=478(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 123
LDI r2, 478
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
