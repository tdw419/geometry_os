; DESCRIPTION: Renders a orange line segment connecting (141, 19) to (272, 20).
; PLAN: r0=141(x1), r1=19(y1), r2=272(x2), r3=20(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 19
LDI r2, 272
LDI r3, 20
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
