; DESCRIPTION: Renders a yellow line segment connecting (92, 105) to (248, 89).
; PLAN: r0=92(x1), r1=105(y1), r2=248(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 105
LDI r2, 248
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
