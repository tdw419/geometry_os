; DESCRIPTION: Composite: Draws a yellow circle centered at (447, 189) with radius 64 then Places a cyan dot at position (194, 122).
; PLAN: r0=447(x), r1=189(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=194(x), r6=122(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 447
LDI r1, 189
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 194
LDI r6, 122
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
