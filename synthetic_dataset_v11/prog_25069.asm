; DESCRIPTION: Renders a purple line between points (221, 224) and (83, 17).
; PLAN: r0=221(x1), r1=224(y1), r2=83(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 224
LDI r2, 83
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
