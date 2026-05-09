; DESCRIPTION: Renders a purple line between points (224, 222) and (48, 54).
; PLAN: r0=224(x1), r1=222(y1), r2=48(x2), r3=54(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 222
LDI r2, 48
LDI r3, 54
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
