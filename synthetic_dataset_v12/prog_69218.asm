; DESCRIPTION: Renders a purple line between points (384, 3) and (194, 131).
; PLAN: r0=384(x1), r1=3(y1), r2=194(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 3
LDI r2, 194
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
