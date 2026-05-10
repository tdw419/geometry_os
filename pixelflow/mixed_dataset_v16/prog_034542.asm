; DESCRIPTION: Composite: Renders a white disk with center (257, 188) and radius 60 then Places a yellow dot at position (436, 202).
; PLAN: r0=257(x), r1=188(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=436(x), r6=202(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 257
LDI r1, 188
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 436
LDI r6, 202
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
