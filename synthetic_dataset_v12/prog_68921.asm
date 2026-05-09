; DESCRIPTION: Composite: Draws a red rectangle at (388, 97) with width 104 and height 105 then Places a red dot at position (24, 64).
; PLAN: r0=388(x), r1=97(y), r2=104(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=24(x), r6=64(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 388
LDI r1, 97
LDI r2, 104
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 64
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
