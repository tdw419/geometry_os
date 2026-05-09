; DESCRIPTION: Renders a blue line between points (149, 232) and (460, 41).
; PLAN: r0=149(x1), r1=232(y1), r2=460(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 232
LDI r2, 460
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
