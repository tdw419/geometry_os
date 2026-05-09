; DESCRIPTION: Renders a purple line between points (274, 224) and (31, 122).
; PLAN: r0=274(x1), r1=224(y1), r2=31(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 224
LDI r2, 31
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
