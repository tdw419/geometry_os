; DESCRIPTION: Renders a purple line between points (336, 113) and (256, 131).
; PLAN: r0=336(x1), r1=113(y1), r2=256(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 113
LDI r2, 256
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
