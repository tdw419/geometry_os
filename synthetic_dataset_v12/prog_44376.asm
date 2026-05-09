; DESCRIPTION: Composite: Draws a blue circle centered at (426, 48) with radius 33 then Places a white dot at position (311, 20).
; PLAN: r0=426(x), r1=48(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=311(x), r6=20(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 426
LDI r1, 48
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 311
LDI r6, 20
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
