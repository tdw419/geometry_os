; DESCRIPTION: Composite: Sets a single yellow pixel at (26, 103) then Draws a cyan circle centered at (159, 213) with radius 43.
; PLAN: r0=26(x), r1=103(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=159(x), r6=213(y), r7=43(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 26
LDI r1, 103
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 159
LDI r6, 213
LDI r7, 43
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
