; DESCRIPTION: Renders a yellow line between points (224, 171) and (224, 53).
; PLAN: r0=224(x1), r1=171(y1), r2=224(x2), r3=53(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 171
LDI r2, 224
LDI r3, 53
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
