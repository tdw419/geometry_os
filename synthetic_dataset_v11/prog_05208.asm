; DESCRIPTION: Renders a blue line between points (41, 123) and (169, 139).
; PLAN: r0=41(x1), r1=123(y1), r2=169(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 123
LDI r2, 169
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
