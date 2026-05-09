; DESCRIPTION: Composite: . Then Places a blue line segment connecting (203, 0) to (125, 142). Then Creates a black circular shape at (124, 105) with radius 37.
; PLAN: r0=203(x1), r1=0(y1), r2=125(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=124(x), r1=105(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue line segment connecting (203, 0) to (125, 142).
; PLAN: r0=203(x1), r1=0(y1), r2=125(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 0
LDI r2, 125
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black circular shape at (124, 105) with radius 37.
; PLAN: r0=124(x), r1=105(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 105
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
