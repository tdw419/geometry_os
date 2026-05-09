; DESCRIPTION: Renders a black line between points (6, 136) and (171, 155).
; PLAN: r0=6(x1), r1=136(y1), r2=171(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 136
LDI r2, 171
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
