; DESCRIPTION: Renders a yellow line between points (224, 174) and (85, 250).
; PLAN: r0=224(x1), r1=174(y1), r2=85(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 174
LDI r2, 85
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
