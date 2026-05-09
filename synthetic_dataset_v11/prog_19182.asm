; DESCRIPTION: Renders a black line between points (155, 94) and (67, 4).
; PLAN: r0=155(x1), r1=94(y1), r2=67(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 94
LDI r2, 67
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
