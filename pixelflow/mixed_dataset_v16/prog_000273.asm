; DESCRIPTION: Renders a yellow line between points (224, 20) and (325, 4).
; PLAN: r0=224(x1), r1=20(y1), r2=325(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 20
LDI r2, 325
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
