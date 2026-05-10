; DESCRIPTION: Renders a orange line segment connecting (115, 132) to (373, 184).
; PLAN: r0=115(x1), r1=132(y1), r2=373(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 132
LDI r2, 373
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
