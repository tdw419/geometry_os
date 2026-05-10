; DESCRIPTION: Composite: Sets a single blue pixel at (23, 117) then Renders a blue disk with center (396, 78) and radius 78.
; PLAN: r0=23(x), r1=117(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=396(x), r6=78(y), r7=78(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 23
LDI r1, 117
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 396
LDI r6, 78
LDI r7, 78
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
