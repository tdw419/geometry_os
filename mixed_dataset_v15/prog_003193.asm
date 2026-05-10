; DESCRIPTION: Composite: Places a white dot at position (299, 146) then Draws a cyan circle centered at (279, 43) with radius 41.
; PLAN: r0=299(x), r1=146(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=279(x), r6=43(y), r7=41(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 299
LDI r1, 146
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 279
LDI r6, 43
LDI r7, 41
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
