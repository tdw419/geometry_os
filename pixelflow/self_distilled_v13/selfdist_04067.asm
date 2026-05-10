; DESCRIPTION: Renders a yellow line segment connecting (358, 5) to (149, 163).
; PLAN: r0=358(x1), r1=5(y1), r2=149(x2), r3=163(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 5
LDI r2, 149
LDI r3, 163
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
