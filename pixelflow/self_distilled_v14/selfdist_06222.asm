; DESCRIPTION: Renders a red line segment connecting (293, 105) to (359, 4).
; PLAN: r0=293(x1), r1=105(y1), r2=359(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 105
LDI r2, 359
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
