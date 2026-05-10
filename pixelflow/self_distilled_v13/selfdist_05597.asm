; DESCRIPTION: Renders a blue line segment connecting (335, 151) to (159, 110).
; PLAN: r0=335(x1), r1=151(y1), r2=159(x2), r3=110(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 151
LDI r2, 159
LDI r3, 110
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
