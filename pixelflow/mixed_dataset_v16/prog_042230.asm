; DESCRIPTION: Composite: Draws a cyan circle centered at (325, 157) with radius 32 then Places a orange 29x109 rectangle at position (194, 28).
; PLAN: r0=325(x), r1=157(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=194(x), r6=28(y), r7=29(width), r8=109(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 325
LDI r1, 157
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 194
LDI r6, 28
LDI r7, 29
LDI r8, 109
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
