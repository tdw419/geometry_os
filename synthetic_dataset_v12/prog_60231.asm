; DESCRIPTION: Composite: Places a blue dot at position (396, 199) then Renders a black disk with center (353, 52) and radius 42.
; PLAN: r0=396(x), r1=199(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=353(x), r6=52(y), r7=42(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 396
LDI r1, 199
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 353
LDI r6, 52
LDI r7, 42
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
