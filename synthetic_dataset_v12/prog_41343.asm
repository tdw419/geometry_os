; DESCRIPTION: Renders a purple line between points (322, 96) and (98, 135).
; PLAN: r0=322(x1), r1=96(y1), r2=98(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 96
LDI r2, 98
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
