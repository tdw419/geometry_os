; DESCRIPTION: Composite: Draws a green circle centered at (184, 206) with radius 39 then Places a black dot at position (109, 202).
; PLAN: r0=184(x), r1=206(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=109(x), r6=202(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 184
LDI r1, 206
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 109
LDI r6, 202
LDI r7, 0x000000
PSET r5, r6, r7
HALT
