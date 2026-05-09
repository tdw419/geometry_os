; DESCRIPTION: Renders a purple line between points (204, 255) and (151, 49).
; PLAN: r0=204(x1), r1=255(y1), r2=151(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 255
LDI r2, 151
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
