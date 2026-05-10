; DESCRIPTION: Renders a yellow line between points (395, 10) and (224, 185).
; PLAN: r0=395(x1), r1=10(y1), r2=224(x2), r3=185(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 10
LDI r2, 224
LDI r3, 185
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
