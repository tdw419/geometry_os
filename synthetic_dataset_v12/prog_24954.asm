; DESCRIPTION: Composite: Places a black dot at position (306, 153) then Draws a cyan circle centered at (304, 53) with radius 29.
; PLAN: r0=306(x), r1=153(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=304(x), r6=53(y), r7=29(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 306
LDI r1, 153
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 304
LDI r6, 53
LDI r7, 29
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
