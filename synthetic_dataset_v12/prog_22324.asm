; DESCRIPTION: Renders a purple line between points (172, 14) and (414, 224).
; PLAN: r0=172(x1), r1=14(y1), r2=414(x2), r3=224(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 14
LDI r2, 414
LDI r3, 224
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
