; DESCRIPTION: Draws a blue line from (148, 52) to (119, 41).
; PLAN: r0=148(x1), r1=52(y1), r2=119(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 52
LDI r2, 119
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
