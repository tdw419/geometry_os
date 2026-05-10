; DESCRIPTION: Renders a yellow line segment connecting (222, 196) to (83, 175).
; PLAN: r0=222(x1), r1=196(y1), r2=83(x2), r3=175(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 196
LDI r2, 83
LDI r3, 175
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
