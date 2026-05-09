; DESCRIPTION: Renders a orange line between points (328, 201) and (359, 224).
; PLAN: r0=328(x1), r1=201(y1), r2=359(x2), r3=224(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 201
LDI r2, 359
LDI r3, 224
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
