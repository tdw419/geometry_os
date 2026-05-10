; DESCRIPTION: Renders a purple line segment connecting (134, 28) to (125, 59).
; PLAN: r0=134(x1), r1=28(y1), r2=125(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 28
LDI r2, 125
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
