; DESCRIPTION: Composite: Creates a white circular shape at (378, 64) with radius 49 then Places a cyan dot at position (135, 213).
; PLAN: r0=378(x), r1=64(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=135(x), r6=213(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 378
LDI r1, 64
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 135
LDI r6, 213
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
