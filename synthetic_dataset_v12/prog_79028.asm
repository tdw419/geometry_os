; DESCRIPTION: Renders a blue line between points (129, 251) and (322, 153).
; PLAN: r0=129(x1), r1=251(y1), r2=322(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 251
LDI r2, 322
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
