; DESCRIPTION: Renders a purple line between points (224, 54) and (151, 86).
; PLAN: r0=224(x1), r1=54(y1), r2=151(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 54
LDI r2, 151
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
