; DESCRIPTION: Composite: Sets a single blue pixel at (53, 42) then Renders a white disk with center (399, 77) and radius 69.
; PLAN: r0=53(x), r1=42(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=399(x), r6=77(y), r7=69(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 53
LDI r1, 42
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 399
LDI r6, 77
LDI r7, 69
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
