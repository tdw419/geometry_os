; DESCRIPTION: Renders a purple line between points (58, 224) and (45, 170).
; PLAN: r0=58(x1), r1=224(y1), r2=45(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 224
LDI r2, 45
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
