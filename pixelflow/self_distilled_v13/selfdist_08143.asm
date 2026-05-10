; DESCRIPTION: Renders a yellow line segment connecting (200, 43) to (110, 125).
; PLAN: r0=200(x1), r1=43(y1), r2=110(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 43
LDI r2, 110
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
