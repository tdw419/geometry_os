; DESCRIPTION: Renders a yellow line between points (224, 75) and (314, 15).
; PLAN: r0=224(x1), r1=75(y1), r2=314(x2), r3=15(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 75
LDI r2, 314
LDI r3, 15
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
