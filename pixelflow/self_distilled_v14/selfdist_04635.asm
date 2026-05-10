; DESCRIPTION: Renders a white line segment connecting (103, 110) to (2, 191).
; PLAN: r0=103(x1), r1=110(y1), r2=2(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 110
LDI r2, 2
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
