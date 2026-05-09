; DESCRIPTION: Composite: . Then Places a white circle of radius 10 at center (86, 238). Then Places a white dot at position (163, 37).
; PLAN: r0=86(x), r1=238(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=163(x), r1=37(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white circle of radius 10 at center (86, 238).
; PLAN: r0=86(x), r1=238(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 238
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white dot at position (163, 37).
; PLAN: r0=163(x), r1=37(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 163
LDI r1, 37
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
