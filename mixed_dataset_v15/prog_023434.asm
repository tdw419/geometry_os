; DESCRIPTION: Renders a purple line between points (181, 44) and (384, 144).
; PLAN: r0=181(x1), r1=44(y1), r2=384(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 44
LDI r2, 384
LDI r3, 144
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
