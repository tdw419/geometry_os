; DESCRIPTION: Composite: Sets a single cyan pixel at (415, 128) then Draws a white circle centered at (319, 114) with radius 13.
; PLAN: r0=415(x), r1=128(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=319(x), r6=114(y), r7=13(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 415
LDI r1, 128
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 319
LDI r6, 114
LDI r7, 13
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
