; DESCRIPTION: Composite: Draws a cyan circle centered at (426, 131) with radius 12 then Places a yellow dot at position (370, 125).
; PLAN: r0=426(x), r1=131(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=370(x), r6=125(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 426
LDI r1, 131
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 370
LDI r6, 125
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
