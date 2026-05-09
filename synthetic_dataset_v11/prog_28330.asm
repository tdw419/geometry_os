; DESCRIPTION: Renders a blue line between points (224, 247) and (224, 199).
; PLAN: r0=224(x1), r1=247(y1), r2=224(x2), r3=199(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 247
LDI r2, 224
LDI r3, 199
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
