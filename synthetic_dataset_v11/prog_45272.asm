; DESCRIPTION: Renders a blue line between points (155, 200) and (107, 224).
; PLAN: r0=155(x1), r1=200(y1), r2=107(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 200
LDI r2, 107
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
