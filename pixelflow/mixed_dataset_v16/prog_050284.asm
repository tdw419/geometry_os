; DESCRIPTION: Renders a magenta line segment connecting (315, 102) to (175, 78).
; PLAN: r0=315(x1), r1=102(y1), r2=175(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 102
LDI r2, 175
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
