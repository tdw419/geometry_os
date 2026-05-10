; DESCRIPTION: Composite: Places a black dot at position (339, 138) then Draws a orange circle centered at (311, 175) with radius 26.
; PLAN: r0=339(x), r1=138(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=311(x), r6=175(y), r7=26(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 339
LDI r1, 138
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 311
LDI r6, 175
LDI r7, 26
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
