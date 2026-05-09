; DESCRIPTION: Renders a purple line between points (224, 35) and (165, 104).
; PLAN: r0=224(x1), r1=35(y1), r2=165(x2), r3=104(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 35
LDI r2, 165
LDI r3, 104
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
