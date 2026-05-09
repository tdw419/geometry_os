; DESCRIPTION: Composite: . Then Sets a single black pixel at (80, 98). Then Renders a white disk with center (56, 76) and radius 46.
; PLAN: r0=80(x), r1=98(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=56(x), r1=76(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single black pixel at (80, 98).
; PLAN: r0=80(x), r1=98(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 80
LDI r1, 98
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a white disk with center (56, 76) and radius 46.
; PLAN: r0=56(x), r1=76(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 76
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
