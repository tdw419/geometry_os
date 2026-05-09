; DESCRIPTION: Renders a black line between points (43, 155) and (116, 136).
; PLAN: r0=43(x1), r1=155(y1), r2=116(x2), r3=136(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 155
LDI r2, 116
LDI r3, 136
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
