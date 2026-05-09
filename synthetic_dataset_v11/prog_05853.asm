; DESCRIPTION: Renders a blue line between points (224, 186) and (91, 237).
; PLAN: r0=224(x1), r1=186(y1), r2=91(x2), r3=237(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 186
LDI r2, 91
LDI r3, 237
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
