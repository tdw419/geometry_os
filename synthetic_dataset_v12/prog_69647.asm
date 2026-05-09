; DESCRIPTION: Renders a yellow line between points (322, 76) and (148, 116).
; PLAN: r0=322(x1), r1=76(y1), r2=148(x2), r3=116(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 76
LDI r2, 148
LDI r3, 116
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
