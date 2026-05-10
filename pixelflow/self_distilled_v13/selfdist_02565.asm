; DESCRIPTION: Renders a white line segment connecting (22, 85) to (222, 100).
; PLAN: r0=22(x1), r1=85(y1), r2=222(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 85
LDI r2, 222
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
