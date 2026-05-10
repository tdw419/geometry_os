; DESCRIPTION: Composite: Draws a red rectangle at (166, 195) with width 40 and height 23 then Places a orange dot at position (134, 94).
; PLAN: r0=166(x), r1=195(y), r2=40(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=134(x), r6=94(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 166
LDI r1, 195
LDI r2, 40
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 94
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
