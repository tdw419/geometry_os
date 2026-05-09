; DESCRIPTION: Composite: Places a orange 102x24 rectangle at position (140, 117) then Draws a cyan circle centered at (316, 29) with radius 12.
; PLAN: r0=140(x), r1=117(y), r2=102(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=316(x), r6=29(y), r7=12(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 140
LDI r1, 117
LDI r2, 102
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 29
LDI r7, 12
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
