; DESCRIPTION: Renders a purple line between points (230, 137) and (35, 32).
; PLAN: r0=230(x1), r1=137(y1), r2=35(x2), r3=32(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 137
LDI r2, 35
LDI r3, 32
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
