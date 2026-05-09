; DESCRIPTION: Renders a purple line between points (476, 221) and (278, 129).
; PLAN: r0=476(x1), r1=221(y1), r2=278(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 221
LDI r2, 278
LDI r3, 129
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
