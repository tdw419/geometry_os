; DESCRIPTION: Composite: . Then Places a orange line segment connecting (101, 105) to (181, 201). Then Renders a magenta disk with center (122, 96) and radius 30.
; PLAN: r0=101(x1), r1=105(y1), r2=181(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=122(x), r1=96(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange line segment connecting (101, 105) to (181, 201).
; PLAN: r0=101(x1), r1=105(y1), r2=181(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 105
LDI r2, 181
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta disk with center (122, 96) and radius 30.
; PLAN: r0=122(x), r1=96(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 96
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
