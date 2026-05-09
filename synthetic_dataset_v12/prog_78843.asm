; DESCRIPTION: Renders a purple line between points (225, 255) and (322, 242).
; PLAN: r0=225(x1), r1=255(y1), r2=322(x2), r3=242(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 255
LDI r2, 322
LDI r3, 242
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
