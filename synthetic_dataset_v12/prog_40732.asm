; DESCRIPTION: Renders a purple line between points (175, 3) and (120, 92).
; PLAN: r0=175(x1), r1=3(y1), r2=120(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 3
LDI r2, 120
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
