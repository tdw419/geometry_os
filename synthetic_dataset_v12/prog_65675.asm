; DESCRIPTION: Renders a red line between points (451, 129) and (224, 20).
; PLAN: r0=451(x1), r1=129(y1), r2=224(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 129
LDI r2, 224
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
