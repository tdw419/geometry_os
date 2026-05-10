; DESCRIPTION: Renders a purple line segment connecting (257, 136) to (301, 188).
; PLAN: r0=257(x1), r1=136(y1), r2=301(x2), r3=188(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 136
LDI r2, 301
LDI r3, 188
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
