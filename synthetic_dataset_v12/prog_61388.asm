; DESCRIPTION: Composite: Creates a yellow circular shape at (64, 209) with radius 44 then Places a black dot at position (179, 135).
; PLAN: r0=64(x), r1=209(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=179(x), r6=135(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 64
LDI r1, 209
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 179
LDI r6, 135
LDI r7, 0x000000
PSET r5, r6, r7
HALT
