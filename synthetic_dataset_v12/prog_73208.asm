; DESCRIPTION: Renders a purple line between points (117, 216) and (224, 81).
; PLAN: r0=117(x1), r1=216(y1), r2=224(x2), r3=81(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 216
LDI r2, 224
LDI r3, 81
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
