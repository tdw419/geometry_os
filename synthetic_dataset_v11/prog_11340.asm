; DESCRIPTION: Composite: . Then Sets a single black pixel at (244, 64). Then Renders a blue disk with center (97, 163) and radius 70.
; PLAN: r0=244(x), r1=64(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=97(x), r1=163(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single black pixel at (244, 64).
; PLAN: r0=244(x), r1=64(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 244
LDI r1, 64
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a blue disk with center (97, 163) and radius 70.
; PLAN: r0=97(x), r1=163(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 163
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
