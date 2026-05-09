; DESCRIPTION: Composite: Sets a single cyan pixel at (320, 108) then Creates a white circular shape at (257, 43) with radius 18.
; PLAN: r0=320(x), r1=108(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=257(x), r6=43(y), r7=18(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 320
LDI r1, 108
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 257
LDI r6, 43
LDI r7, 18
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
