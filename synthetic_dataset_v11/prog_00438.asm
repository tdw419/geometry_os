; DESCRIPTION: Renders a purple line between points (76, 227) and (28, 144).
; PLAN: r0=76(x1), r1=227(y1), r2=28(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 227
LDI r2, 28
LDI r3, 144
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
