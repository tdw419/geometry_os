; DESCRIPTION: Renders a orange line segment connecting (227, 172) to (3, 120).
; PLAN: r0=227(x1), r1=172(y1), r2=3(x2), r3=120(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 172
LDI r2, 3
LDI r3, 120
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
