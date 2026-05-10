; DESCRIPTION: Renders a green line segment connecting (90, 172) to (390, 153).
; PLAN: r0=90(x1), r1=172(y1), r2=390(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 172
LDI r2, 390
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
