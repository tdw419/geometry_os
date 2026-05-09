; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (172, 0). Then Renders a white disk with center (157, 78) and radius 66.
; PLAN: r0=172(x), r1=0(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=157(x), r1=78(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single magenta pixel at (172, 0).
; PLAN: r0=172(x), r1=0(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 172
LDI r1, 0
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a white disk with center (157, 78) and radius 66.
; PLAN: r0=157(x), r1=78(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 78
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
