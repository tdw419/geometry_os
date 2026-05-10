; DESCRIPTION: Renders a yellow line segment connecting (0, 137) to (385, 175).
; PLAN: r0=0(x1), r1=137(y1), r2=385(x2), r3=175(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 137
LDI r2, 385
LDI r3, 175
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
