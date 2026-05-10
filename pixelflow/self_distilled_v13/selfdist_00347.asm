; DESCRIPTION: Renders a purple line segment connecting (9, 146) to (171, 62).
; PLAN: r0=9(x1), r1=146(y1), r2=171(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 146
LDI r2, 171
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
