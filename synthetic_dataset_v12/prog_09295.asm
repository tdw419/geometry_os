; DESCRIPTION: Renders a black line between points (119, 199) and (322, 205).
; PLAN: r0=119(x1), r1=199(y1), r2=322(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 199
LDI r2, 322
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
