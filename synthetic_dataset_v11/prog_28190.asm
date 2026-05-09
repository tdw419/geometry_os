; DESCRIPTION: Renders a black line between points (157, 21) and (192, 136).
; PLAN: r0=157(x1), r1=21(y1), r2=192(x2), r3=136(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 21
LDI r2, 192
LDI r3, 136
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
