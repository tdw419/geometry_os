; DESCRIPTION: Renders a blue line between points (41, 212) and (193, 1).
; PLAN: r0=41(x1), r1=212(y1), r2=193(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 212
LDI r2, 193
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
