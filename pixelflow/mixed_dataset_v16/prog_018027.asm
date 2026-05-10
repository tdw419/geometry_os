; DESCRIPTION: Composite: Creates a black circular shape at (247, 78) with radius 72 then Places a purple dot at position (235, 253).
; PLAN: r0=247(x), r1=78(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=235(x), r6=253(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 247
LDI r1, 78
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 235
LDI r6, 253
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
