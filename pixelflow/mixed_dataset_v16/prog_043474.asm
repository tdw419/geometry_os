; DESCRIPTION: Renders a purple line between points (240, 32) and (177, 116).
; PLAN: r0=240(x1), r1=32(y1), r2=177(x2), r3=116(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 32
LDI r2, 177
LDI r3, 116
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
