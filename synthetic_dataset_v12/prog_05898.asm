; DESCRIPTION: Renders a purple line between points (286, 255) and (93, 135).
; PLAN: r0=286(x1), r1=255(y1), r2=93(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 255
LDI r2, 93
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
