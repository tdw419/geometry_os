; DESCRIPTION: Renders a blue line between points (70, 224) and (155, 109).
; PLAN: r0=70(x1), r1=224(y1), r2=155(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 224
LDI r2, 155
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
