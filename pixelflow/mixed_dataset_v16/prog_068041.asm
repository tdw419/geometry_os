; DESCRIPTION: Composite: Draws a cyan rectangle at (61, 23) with width 11 and height 26 then Places a blue dot at position (206, 245).
; PLAN: r0=61(x), r1=23(y), r2=11(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=206(x), r6=245(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 61
LDI r1, 23
LDI r2, 11
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 245
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
