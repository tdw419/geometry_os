; DESCRIPTION: Renders a blue line between points (224, 154) and (322, 18).
; PLAN: r0=224(x1), r1=154(y1), r2=322(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 154
LDI r2, 322
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
