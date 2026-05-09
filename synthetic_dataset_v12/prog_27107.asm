; DESCRIPTION: Composite: Sets a single blue pixel at (439, 128) then Draws a yellow circle centered at (93, 166) with radius 19.
; PLAN: r0=439(x), r1=128(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=93(x), r6=166(y), r7=19(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 439
LDI r1, 128
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 93
LDI r6, 166
LDI r7, 19
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
