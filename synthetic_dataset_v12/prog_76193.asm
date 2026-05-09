; DESCRIPTION: Renders a orange line between points (122, 225) and (325, 224).
; PLAN: r0=122(x1), r1=225(y1), r2=325(x2), r3=224(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 225
LDI r2, 325
LDI r3, 224
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
