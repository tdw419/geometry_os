; DESCRIPTION: Renders a blue line between points (399, 122) and (212, 41).
; PLAN: r0=399(x1), r1=122(y1), r2=212(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 122
LDI r2, 212
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
