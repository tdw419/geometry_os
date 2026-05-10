; DESCRIPTION: Renders a purple line segment connecting (178, 35) to (35, 68).
; PLAN: r0=178(x1), r1=35(y1), r2=35(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 35
LDI r2, 35
LDI r3, 68
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
