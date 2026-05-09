; DESCRIPTION: Renders a purple line between points (224, 251) and (1, 169).
; PLAN: r0=224(x1), r1=251(y1), r2=1(x2), r3=169(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 251
LDI r2, 1
LDI r3, 169
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
