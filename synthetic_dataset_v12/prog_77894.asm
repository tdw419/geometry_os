; DESCRIPTION: Renders a purple line between points (322, 184) and (384, 157).
; PLAN: r0=322(x1), r1=184(y1), r2=384(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 184
LDI r2, 384
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
