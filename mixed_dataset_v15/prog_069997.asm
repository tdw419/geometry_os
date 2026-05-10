; DESCRIPTION: Composite: Sets a single white pixel at (378, 76) then Renders a green disk with center (241, 63) and radius 29.
; PLAN: r0=378(x), r1=76(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=241(x), r6=63(y), r7=29(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 378
LDI r1, 76
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 241
LDI r6, 63
LDI r7, 29
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
