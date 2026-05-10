; DESCRIPTION: Renders a black line between points (192, 136) and (177, 153).
; PLAN: r0=192(x1), r1=136(y1), r2=177(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 136
LDI r2, 177
LDI r3, 153
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
