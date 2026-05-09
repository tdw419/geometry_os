; DESCRIPTION: Renders a blue line between points (237, 250) and (342, 224).
; PLAN: r0=237(x1), r1=250(y1), r2=342(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 250
LDI r2, 342
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
