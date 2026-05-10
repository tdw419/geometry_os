; DESCRIPTION: Renders a orange line segment connecting (10, 147) to (338, 32).
; PLAN: r0=10(x1), r1=147(y1), r2=338(x2), r3=32(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 147
LDI r2, 338
LDI r3, 32
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
