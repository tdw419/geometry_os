; DESCRIPTION: Composite: Places a red dot at position (264, 178) then Creates a black circular shape at (327, 143) with radius 48.
; PLAN: r0=264(x), r1=178(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=327(x), r6=143(y), r7=48(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 264
LDI r1, 178
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 327
LDI r6, 143
LDI r7, 48
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
