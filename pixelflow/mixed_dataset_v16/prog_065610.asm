; DESCRIPTION: Renders a black line between points (476, 164) and (155, 119).
; PLAN: r0=476(x1), r1=164(y1), r2=155(x2), r3=119(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 164
LDI r2, 155
LDI r3, 119
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
