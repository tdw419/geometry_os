; DESCRIPTION: Composite: Draws a cyan circle centered at (54, 24) with radius 17 then Places a white dot at position (183, 96).
; PLAN: r0=54(x), r1=24(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=183(x), r6=96(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 54
LDI r1, 24
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 183
LDI r6, 96
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
