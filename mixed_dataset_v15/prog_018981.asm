; DESCRIPTION: Renders a orange line segment connecting (102, 84) to (317, 124).
; PLAN: r0=102(x1), r1=84(y1), r2=317(x2), r3=124(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 84
LDI r2, 317
LDI r3, 124
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
