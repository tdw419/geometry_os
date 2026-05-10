; DESCRIPTION: Composite: Places a white dot at position (384, 8) then Creates a green circular shape at (125, 96) with radius 37.
; PLAN: r0=384(x), r1=8(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=125(x), r6=96(y), r7=37(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 384
LDI r1, 8
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 125
LDI r6, 96
LDI r7, 37
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
