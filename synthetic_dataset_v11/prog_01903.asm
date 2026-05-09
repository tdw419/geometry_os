; DESCRIPTION: Composite: . Then Renders a blue disk with center (204, 66) and radius 18. Then Places a purple dot at position (207, 12).
; PLAN: r0=204(x), r1=66(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=207(x), r1=12(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue disk with center (204, 66) and radius 18.
; PLAN: r0=204(x), r1=66(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 66
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple dot at position (207, 12).
; PLAN: r0=207(x), r1=12(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 207
LDI r1, 12
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
