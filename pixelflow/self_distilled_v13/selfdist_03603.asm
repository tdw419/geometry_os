; DESCRIPTION: Renders a blue line segment connecting (183, 113) to (351, 49).
; PLAN: r0=183(x1), r1=113(y1), r2=351(x2), r3=49(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 113
LDI r2, 351
LDI r3, 49
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
