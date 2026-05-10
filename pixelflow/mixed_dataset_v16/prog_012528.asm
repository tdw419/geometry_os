; DESCRIPTION: Composite: Creates a magenta circular shape at (355, 156) with radius 27 then Places a black dot at position (349, 150).
; PLAN: r0=355(x), r1=156(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=349(x), r6=150(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 355
LDI r1, 156
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 349
LDI r6, 150
LDI r7, 0x000000
PSET r5, r6, r7
HALT
