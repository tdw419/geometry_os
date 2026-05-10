; DESCRIPTION: Renders a yellow line segment connecting (172, 137) to (299, 90).
; PLAN: r0=172(x1), r1=137(y1), r2=299(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 137
LDI r2, 299
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
