; DESCRIPTION: Renders a blue line between points (41, 251) and (109, 198).
; PLAN: r0=41(x1), r1=251(y1), r2=109(x2), r3=198(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 251
LDI r2, 109
LDI r3, 198
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
