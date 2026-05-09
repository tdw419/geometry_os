; DESCRIPTION: Composite: Draws a orange rectangle at (87, 117) with width 35 and height 33 then Places a black dot at position (471, 199).
; PLAN: r0=87(x), r1=117(y), r2=35(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=471(x), r6=199(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 87
LDI r1, 117
LDI r2, 35
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 471
LDI r6, 199
LDI r7, 0x000000
PSET r5, r6, r7
HALT
