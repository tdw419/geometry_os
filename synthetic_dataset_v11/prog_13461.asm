; DESCRIPTION: Renders a yellow line between points (237, 133) and (224, 32).
; PLAN: r0=237(x1), r1=133(y1), r2=224(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 133
LDI r2, 224
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
