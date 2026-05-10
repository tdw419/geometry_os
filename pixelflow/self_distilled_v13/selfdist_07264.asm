; DESCRIPTION: Renders a orange line segment connecting (174, 62) to (94, 64).
; PLAN: r0=174(x1), r1=62(y1), r2=94(x2), r3=64(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 62
LDI r2, 94
LDI r3, 64
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
