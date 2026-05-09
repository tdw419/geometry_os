; DESCRIPTION: Renders a black line between points (227, 98) and (62, 230).
; PLAN: r0=227(x1), r1=98(y1), r2=62(x2), r3=230(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 98
LDI r2, 62
LDI r3, 230
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
