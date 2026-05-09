; DESCRIPTION: Composite: Places a black dot at position (259, 183) then Draws a purple circle centered at (128, 99) with radius 50.
; PLAN: r0=259(x), r1=183(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=128(x), r6=99(y), r7=50(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 259
LDI r1, 183
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 128
LDI r6, 99
LDI r7, 50
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
