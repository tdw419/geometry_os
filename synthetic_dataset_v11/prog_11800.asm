; DESCRIPTION: Composite: . Then Places a white dot at position (155, 59). Then Renders a white disk with center (149, 83) and radius 73.
; PLAN: r0=155(x), r1=59(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=149(x), r1=83(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white dot at position (155, 59).
; PLAN: r0=155(x), r1=59(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 155
LDI r1, 59
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a white disk with center (149, 83) and radius 73.
; PLAN: r0=149(x), r1=83(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 83
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
