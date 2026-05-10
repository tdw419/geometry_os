; DESCRIPTION: Renders a orange line segment connecting (142, 189) to (280, 89).
; PLAN: r0=142(x1), r1=189(y1), r2=280(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 189
LDI r2, 280
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
