; DESCRIPTION: Renders a blue line between points (224, 212) and (81, 201).
; PLAN: r0=224(x1), r1=212(y1), r2=81(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 212
LDI r2, 81
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
