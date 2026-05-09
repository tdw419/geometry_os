; DESCRIPTION: Renders a purple line between points (224, 80) and (188, 241).
; PLAN: r0=224(x1), r1=80(y1), r2=188(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 80
LDI r2, 188
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
