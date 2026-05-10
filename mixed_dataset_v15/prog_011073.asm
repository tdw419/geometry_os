; DESCRIPTION: Composite: Places a white dot at position (496, 154) then Places a magenta circle of radius 13 at center (249, 57).
; PLAN: r0=496(x), r1=154(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=249(x), r6=57(y), r7=13(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 496
LDI r1, 154
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 249
LDI r6, 57
LDI r7, 13
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
