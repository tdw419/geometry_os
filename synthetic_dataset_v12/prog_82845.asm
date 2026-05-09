; DESCRIPTION: Renders a yellow line between points (224, 120) and (1, 212).
; PLAN: r0=224(x1), r1=120(y1), r2=1(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 120
LDI r2, 1
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
