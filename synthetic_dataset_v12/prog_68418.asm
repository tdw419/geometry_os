; DESCRIPTION: Renders a yellow line between points (334, 112) and (395, 175).
; PLAN: r0=334(x1), r1=112(y1), r2=395(x2), r3=175(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 112
LDI r2, 395
LDI r3, 175
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
