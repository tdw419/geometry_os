; DESCRIPTION: Renders a red line segment connecting (125, 85) to (230, 175).
; PLAN: r0=125(x1), r1=85(y1), r2=230(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 85
LDI r2, 230
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
