; DESCRIPTION: Composite: Sets a single magenta pixel at (159, 253) then Creates a green circular shape at (62, 18) with radius 12.
; PLAN: r0=159(x), r1=253(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=62(x), r6=18(y), r7=12(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 159
LDI r1, 253
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 62
LDI r6, 18
LDI r7, 12
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
