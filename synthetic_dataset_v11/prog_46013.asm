; DESCRIPTION: Composite: . Then Places a white line segment connecting (155, 157) to (219, 240). Then Renders a purple disk with center (144, 67) and radius 40.
; PLAN: r0=155(x1), r1=157(y1), r2=219(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=144(x), r1=67(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white line segment connecting (155, 157) to (219, 240).
; PLAN: r0=155(x1), r1=157(y1), r2=219(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 157
LDI r2, 219
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (144, 67) and radius 40.
; PLAN: r0=144(x), r1=67(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 67
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
