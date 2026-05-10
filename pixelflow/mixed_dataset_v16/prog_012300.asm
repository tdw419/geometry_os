; DESCRIPTION: Renders a orange line segment connecting (273, 157) to (379, 163).
; PLAN: r0=273(x1), r1=157(y1), r2=379(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 157
LDI r2, 379
LDI r3, 163
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
