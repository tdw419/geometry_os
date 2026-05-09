; DESCRIPTION: Composite: . Then Places a purple dot at position (122, 18). Then Renders a black disk with center (103, 130) and radius 78.
; PLAN: r0=122(x), r1=18(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=103(x), r1=130(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple dot at position (122, 18).
; PLAN: r0=122(x), r1=18(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 122
LDI r1, 18
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a black disk with center (103, 130) and radius 78.
; PLAN: r0=103(x), r1=130(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 130
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
