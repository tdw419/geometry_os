; DESCRIPTION: Renders a red line segment connecting (125, 45) to (233, 136).
; PLAN: r0=125(x1), r1=45(y1), r2=233(x2), r3=136(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 45
LDI r2, 233
LDI r3, 136
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
