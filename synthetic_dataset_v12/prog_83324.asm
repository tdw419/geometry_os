; DESCRIPTION: Renders a yellow line between points (136, 169) and (310, 234).
; PLAN: r0=136(x1), r1=169(y1), r2=310(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 169
LDI r2, 310
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
