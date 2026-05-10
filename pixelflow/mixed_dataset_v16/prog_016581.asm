; DESCRIPTION: Composite: Draws a orange circle centered at (25, 128) with radius 13 then Places a cyan 19x108 rectangle at position (98, 139).
; PLAN: r0=25(x), r1=128(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=98(x), r6=139(y), r7=19(width), r8=108(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 25
LDI r1, 128
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 98
LDI r6, 139
LDI r7, 19
LDI r8, 108
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
