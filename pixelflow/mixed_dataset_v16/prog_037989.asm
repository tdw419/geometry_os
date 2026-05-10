; DESCRIPTION: Renders a red line between points (30, 155) and (501, 119).
; PLAN: r0=30(x1), r1=155(y1), r2=501(x2), r3=119(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 155
LDI r2, 501
LDI r3, 119
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
