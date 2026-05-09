; DESCRIPTION: Renders a purple line between points (92, 91) and (264, 181).
; PLAN: r0=92(x1), r1=91(y1), r2=264(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 91
LDI r2, 264
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
