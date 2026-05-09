; DESCRIPTION: Composite: Draws a cyan rectangle at (421, 111) with width 62 and height 31 then Places a orange dot at position (38, 98).
; PLAN: r0=421(x), r1=111(y), r2=62(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=38(x), r6=98(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 421
LDI r1, 111
LDI r2, 62
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 98
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
