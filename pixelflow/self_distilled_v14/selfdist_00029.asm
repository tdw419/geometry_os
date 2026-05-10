; DESCRIPTION: Renders a orange line segment connecting (253, 38) to (396, 147).
; PLAN: r0=253(x1), r1=38(y1), r2=396(x2), r3=147(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 38
LDI r2, 396
LDI r3, 147
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
