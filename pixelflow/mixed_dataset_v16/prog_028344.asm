; DESCRIPTION: Composite: Sets a single black pixel at (415, 197) then Creates a white circular shape at (281, 69) with radius 51.
; PLAN: r0=415(x), r1=197(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=281(x), r6=69(y), r7=51(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 415
LDI r1, 197
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 281
LDI r6, 69
LDI r7, 51
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
