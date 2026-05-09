; DESCRIPTION: Renders a yellow line between points (396, 183) and (224, 40).
; PLAN: r0=396(x1), r1=183(y1), r2=224(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 183
LDI r2, 224
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
