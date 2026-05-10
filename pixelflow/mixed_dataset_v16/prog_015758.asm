; DESCRIPTION: Renders a orange line between points (216, 53) and (478, 133).
; PLAN: r0=216(x1), r1=53(y1), r2=478(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 53
LDI r2, 478
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
