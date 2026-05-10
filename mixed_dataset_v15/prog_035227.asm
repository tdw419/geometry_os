; DESCRIPTION: Renders a blue line segment connecting (157, 186) to (375, 172).
; PLAN: r0=157(x1), r1=186(y1), r2=375(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 186
LDI r2, 375
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
