; DESCRIPTION: Composite: . Then Places a white line segment connecting (175, 213) to (130, 201). Then Renders a white disk with center (56, 191) and radius 40.
; PLAN: r0=175(x1), r1=213(y1), r2=130(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=56(x), r1=191(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white line segment connecting (175, 213) to (130, 201).
; PLAN: r0=175(x1), r1=213(y1), r2=130(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 213
LDI r2, 130
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white disk with center (56, 191) and radius 40.
; PLAN: r0=56(x), r1=191(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 191
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
