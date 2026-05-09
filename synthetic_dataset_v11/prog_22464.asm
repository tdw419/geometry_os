; DESCRIPTION: Composite: . Then Places a white dot at position (219, 142). Then Renders a black disk with center (66, 99) and radius 38.
; PLAN: r0=219(x), r1=142(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=66(x), r1=99(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white dot at position (219, 142).
; PLAN: r0=219(x), r1=142(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 219
LDI r1, 142
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a black disk with center (66, 99) and radius 38.
; PLAN: r0=66(x), r1=99(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 99
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
