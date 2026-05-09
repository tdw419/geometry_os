; DESCRIPTION: Composite: Creates a blue circular shape at (98, 106) with radius 43 then Places a black dot at position (63, 115).
; PLAN: r0=98(x), r1=106(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=63(x), r6=115(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 98
LDI r1, 106
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 63
LDI r6, 115
LDI r7, 0x000000
PSET r5, r6, r7
HALT
