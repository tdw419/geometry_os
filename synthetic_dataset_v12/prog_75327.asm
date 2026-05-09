; DESCRIPTION: Composite: Draws a white rectangle at (167, 136) with width 69 and height 18 then Places a orange dot at position (134, 83).
; PLAN: r0=167(x), r1=136(y), r2=69(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=134(x), r6=83(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 167
LDI r1, 136
LDI r2, 69
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 83
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
