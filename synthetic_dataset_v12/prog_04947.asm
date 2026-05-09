; DESCRIPTION: Renders a orange line between points (417, 224) and (509, 80).
; PLAN: r0=417(x1), r1=224(y1), r2=509(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 224
LDI r2, 509
LDI r3, 80
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
