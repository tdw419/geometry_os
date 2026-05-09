; DESCRIPTION: Renders a purple line between points (286, 140) and (144, 224).
; PLAN: r0=286(x1), r1=140(y1), r2=144(x2), r3=224(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 140
LDI r2, 144
LDI r3, 224
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
