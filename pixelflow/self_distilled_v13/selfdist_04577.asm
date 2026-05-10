; DESCRIPTION: Renders a white line segment connecting (337, 79) to (343, 20).
; PLAN: r0=337(x1), r1=79(y1), r2=343(x2), r3=20(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 79
LDI r2, 343
LDI r3, 20
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
