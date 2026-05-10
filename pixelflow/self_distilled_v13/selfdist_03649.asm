; DESCRIPTION: Renders a yellow line segment connecting (358, 183) to (200, 79).
; PLAN: r0=358(x1), r1=183(y1), r2=200(x2), r3=79(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 183
LDI r2, 200
LDI r3, 79
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
