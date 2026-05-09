; DESCRIPTION: Renders a yellow line between points (217, 77) and (163, 5).
; PLAN: r0=217(x1), r1=77(y1), r2=163(x2), r3=5(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 77
LDI r2, 163
LDI r3, 5
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
