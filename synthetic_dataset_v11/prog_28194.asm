; DESCRIPTION: Renders a red line between points (183, 229) and (224, 224).
; PLAN: r0=183(x1), r1=229(y1), r2=224(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 229
LDI r2, 224
LDI r3, 224
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
