; DESCRIPTION: Renders a yellow line segment connecting (229, 28) to (396, 85).
; PLAN: r0=229(x1), r1=28(y1), r2=396(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 28
LDI r2, 396
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
