; DESCRIPTION: Renders a yellow line segment connecting (335, 144) to (200, 125).
; PLAN: r0=335(x1), r1=144(y1), r2=200(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 144
LDI r2, 200
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
