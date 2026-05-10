; DESCRIPTION: Composite: Places a black dot at position (461, 199) then Draws a red rectangle at (102, 99) with width 48 and height 101.
; PLAN: r0=461(x), r1=199(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=102(x), r6=99(y), r7=48(width), r8=101(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 461
LDI r1, 199
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 102
LDI r6, 99
LDI r7, 48
LDI r8, 101
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
