; DESCRIPTION: Composite: . Then Renders a black disk with center (194, 61) and radius 36. Then Places a blue line segment connecting (101, 218) to (164, 240).
; PLAN: r0=194(x), r1=61(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=101(x1), r1=218(y1), r2=164(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (194, 61) and radius 36.
; PLAN: r0=194(x), r1=61(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 61
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue line segment connecting (101, 218) to (164, 240).
; PLAN: r0=101(x1), r1=218(y1), r2=164(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 218
LDI r2, 164
LDI r3, 240
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
