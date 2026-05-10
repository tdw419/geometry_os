; DESCRIPTION: Renders a blue line segment connecting (253, 80) to (167, 199).
; PLAN: r0=253(x1), r1=80(y1), r2=167(x2), r3=199(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 80
LDI r2, 167
LDI r3, 199
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
