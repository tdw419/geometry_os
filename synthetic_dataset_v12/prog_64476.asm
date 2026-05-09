; DESCRIPTION: Renders a blue line between points (442, 250) and (209, 224).
; PLAN: r0=442(x1), r1=250(y1), r2=209(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 250
LDI r2, 209
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
