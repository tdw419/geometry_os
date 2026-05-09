; DESCRIPTION: Renders a purple line between points (269, 232) and (141, 32).
; PLAN: r0=269(x1), r1=232(y1), r2=141(x2), r3=32(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 232
LDI r2, 141
LDI r3, 32
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
